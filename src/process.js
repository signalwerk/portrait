const fs = require("fs");
const { join } = require("path");

const dataPath = "../data";
const layerPath = `${dataPath}/layers`;
const tempPath = `${layerPath}/temp`;

const layersContent = fs.readFileSync(`${layerPath}.json`, "utf8");
const layers = JSON.parse(layersContent);

const filename = (name, index, extension = "psd") =>
  `${`${index}`.padStart(4, "0")}_${name}.${extension}`;

// generate the gs files
let gs2gs = layers
  .filter((item) => item.gs !== false)
  .map((item) => {
    let commands = [];

    commands.push("convert");
    commands.push(`  ${layerPath}/${filename(item.name, item.id, "png")}`);
    commands.push("  \\( -clone 0 -alpha copy -channel A -negate \\)");
    commands.push("  -set colorspace gray");
    commands.push(
      `  \\( -clone 0 -fill "gray(${
        100 - item.gs
      }%)" -draw 'color 0,0 reset' \\)`
    );
    commands.push("  -delete 0");
    commands.push("  -swap 0,1");
    commands.push("  -compose CopyOpacity -composite");
    commands.push(`  ${tempPath}/gs_${filename(item.name, item.id, "psd")}`);

    return commands.join(" \\\n  ");
  });

// generate the cmyk files
let gs2cmyk = layers.map((item) => {
  let commands = [];

  commands.push("convert");
  commands.push(`  ${layerPath}/${filename(item.name, item.id, "png")}`);
  commands.push("  \\( -clone 0 -alpha copy -channel A -negate \\)");
  commands.push("  -set colorspace CMYK");
  commands.push(
    `  \\( -clone 0 -fill "cmyk(${item.cmyk.c}%,${item.cmyk.m}%,${item.cmyk.y}%,${item.cmyk.k}%)" -draw 'color 0,0 reset' \\)`
  );
  commands.push("  -delete 0");
  commands.push("  -swap 0,1");
  commands.push("  -compose CopyOpacity -composite");
  commands.push(`  ${tempPath}/cmyk_${filename(item.name, item.id, "psd")}`);

  return commands.join(" \\\n  ");
});

// generate the rgb files
let gs2rgb = layers.map((item) => {
  let commands = [];

  commands.push("convert");
  commands.push(`  ${layerPath}/${filename(item.name, item.id, "png")}`);
  commands.push(
    `  \\( -clone 0 -fill "rgb(${item.rgb.r},${item.rgb.g},${item.rgb.b})" -draw 'color 0,0 reset' \\)`
  );
  commands.push("  \\( -clone 0 -alpha copy -channel A -negate \\)");
  commands.push("  -delete 0");
  commands.push("  -compose CopyOpacity -composite");
  commands.push(`  ${tempPath}/rgb_${filename(item.name, item.id, "psd")}`);

  return commands.join(" \\\n  ");
});

// combine the layers to one file
const combine = (prefix, filter = (item) => item) => {
  const [first, ...rest] = [...layers].reverse().filter(filter);

  let combine = rest.map((item) => {
    let commands = [];

    // add filename
    commands.push(
      `${tempPath}/${prefix}_${filename(item.name, item.id, "psd")}`
    );
    commands.push("-delete 0"); // Delete the images specified by index, from the image sequence.

    // normal overlay or multiply
    if (item.blendMode === "multiply") {
      commands.push("-compose Multiply");
    } else {
      commands.push("-compose Over");
    }

    // set alpha (! this is a lossy transformation)
    commands.push(
      `-alpha set -channel a -evaluate multiply ${
        (1 * (item[`${prefix}-opacity`] || item.opacity)) / 100
      }`
    );

    return `\\( ${commands.join(" ")} \\)`;
  });

  let all = [
    "convert -respect-parenthesis ",
    `\\( ${tempPath}/${prefix}_${filename(
      first.name,
      layers.length - 1,
      "psd"
    )} \\)`,
    ...combine,
    //
    `${dataPath}/portrait_generated_${prefix}.psd`,
  ];
  return all.join(" \\\n  ");
};

const downscale = (width, colorspace = "rgb") => {
  const format = { cmyk: "tif", gs: "tif", rgb: "png" }[colorspace];
  const prefix = colorspace;
  const device = {
    cmyk: "-compress LZW tiff64:",
    gs: "-compress LZW tiff64:",
    rgb: "",
  }[colorspace];
  const resize = width !== 8000 ? `-resize ${width}x` : "";
  const icc = {
    cmyk: `-profile "/System/Library/ColorSync/Profiles/Generic CMYK Profile.icc"`,
    gs: `-profile "/System/Library/ColorSync/Profiles/Generic Gray Profile.icc"`,
    rgb: "",
  }[colorspace];

  return `convert ${dataPath}/portrait_generated_${prefix}.psd ${resize} -crop ${width}x${width} ${icc} ${device}${dataPath}/portrait_generated_${width}_${prefix}.${format}`;
};

fs.writeFileSync(
  "exec.sh",
  `
mkdir -p ./${tempPath}/

echo "generate layers GS"
${gs2gs.join("\n\n")}

echo "generate layers CMYK"
${gs2cmyk.join("\n\n")}

echo "generate layers RGB"
${gs2rgb.join("\n\n")}

echo "combine layers GS"
${combine("gs", (item) => item.gs !== false)}

echo "combine layers CMYK"
${combine("cmyk")}

echo "combine layers RGB"
${combine("rgb")}

echo "downscale GS"
${downscale(8000, "gs")}
${downscale(6000, "gs")}
${downscale(4000, "gs")}
${downscale(3000, "gs")}
${downscale(2000, "gs")}
${downscale(1500, "gs")}
${downscale(1000, "gs")}
${downscale(500, "gs")}

echo "downscale CMYK"
${downscale(8000, "cmyk")}
${downscale(6000, "cmyk")}
${downscale(4000, "cmyk")}
${downscale(3000, "cmyk")}
${downscale(2000, "cmyk")}
${downscale(1500, "cmyk")}
${downscale(1000, "cmyk")}
${downscale(500, "cmyk")}

echo "downscale RGB (sRGB no Profile)"
${downscale(8000)}
${downscale(6000)}
${downscale(4000)}
${downscale(3000)}
${downscale(2000)}
${downscale(1500)}
${downscale(1000)}
${downscale(500)}

# rm -rf ./${tempPath}/
`
);

// fs.writeFileSync("exec_cmyk.sh", combine("cmyk"));
// fs.writeFileSync("exec_rgb.sh", combine("rgb"));

// fs.writeFileSync(
//   "gs2cmyk.sh",
//   gs2cmyk.join("\n\n") //.replace(/(\( )/g, "\\$1").replace(/ (\))/g, " \\$1")
// );

// fs.writeFileSync(
//   "gs2rgb.sh",
//   gs2rgb.join("\n\n") //.replace(/(\( )/g, "\\$1").replace(/ (\))/g, " \\$1")
// );

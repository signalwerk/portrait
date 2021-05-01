const fs = require("fs");

const layerPath = "../data/layers";

const layersContent = fs.readFileSync(`${layerPath}.json`, "utf8");
const layers = JSON.parse(layersContent);

const filename = (name, index) => `${`${index}`.padStart(4, "0")}_${name}.psd`;

const [first, ...rest] = layers.reverse();

let combine = rest.map((item, index) => {
  let commands = [];

  // add filename
  commands.push(
    `${layerPath}/_${filename(item.name, layers.length - index - 2)}`
  );
  commands.push("-delete 0");

  if (item.blendMode === "multiply") {
    commands.push("-compose Multiply");
  } else {
    commands.push("-compose Over");
  }

  // colorize
  // commands.push(
  //   `-fill "cmyk(${item.cmyk.c}%,${item.cmyk.m}%,${item.cmyk.y}%,${item.cmyk.k}%)" -colorize 100`
  // );

  // set alpha
  commands.push(
    `-alpha set -channel a -evaluate multiply ${(1 * item.opacity) / 100}`
  );

  return `\\( ${commands.join(" ")} \\)`;
});
let all = [
  "convert -respect-parenthesis ",
  `\\( ${layerPath}/_${filename(first.name, layers.length - 1)} \\)`,
  ...combine,
  //
  "result.psd",
];

fs.writeFileSync(
  "exec.sh",
  all.join(" \\\n  ") //.replace(/(\( )/g, "\\$1").replace(/ (\))/g, " \\$1")
);

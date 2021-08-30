import fs from "fs";
import { join } from "path";
import sharp from "sharp";
import layers from "../data/layers.js";

const dataPath = "../data";
const layerPath = `${dataPath}/layers`;
const tempPath = `${layerPath}/temp`;

// const layers = JSON.parse(fs.readFileSync(`${layerPath}.json`, "utf8"));

// const outputSizes = [8000, 6000, 4000, 3000, 2000, 1500, 1000, 500];
const outputSizes = [8000];
// const outputSizes = [500];

const filename = (name, index, extension = "psd") =>
  `${`${index}`.padStart(4, "0")}_${name}.${extension}`;

// const outputSize =

// const outputImage = sharp(source)
//   .resize(outputSize, outputSize)
//   .sharpen()
//   .withMetadata()
//   .interpolateWith(sharp.interpolator.bicubic)
//   .toFile(outputFile, function (err) {
//     // ...
//   });

const getGS = ({ width, height, colors }) => {
  const channels = [];

  colors.forEach((color) => {
    var buf = new ArrayBuffer(width * height);
    var int8view = new Uint8Array(buf);
    for (let w = 0; w < width; w++) {
      for (let h = 0; h < height; h++) {
        int8view[h * width + w] = color;
      }
    }

    // const channel = sharp(int8view, {
    //   raw: { width, height, channels: 1 },
    // });

    channels.push(int8view);
  });

  return channels;
};

async function generateColors() {
  // transcode all the layers to the right size
  layers.forEach(async (layer) => {
    // layers.slice(1, 2).forEach(async (layer) => {
    // cycle through the sizes
    outputSizes.forEach(async (outputSize) => {
      const input = `${layerPath}/${filename(layer.name, layer.id, "png")}`;
      const output = `${tempPath}/${outputSize}_${filename(
        layer.name,
        layer.id,
        "png"
      )}`;

      const alpha = await sharp(input)
        //   .resize(outputSize, outputSize)

        .resize(outputSize, outputSize, {
          kernel: sharp.kernel.lanczos3,
          fit: "cover",
          position: "left top",
          // background: { r: 255, g: 255, b: 255, alpha: 0.5 }
        })
        .negate()
        // .toColourspace('b-w')
        .toBuffer();

      // const color = await sharp({
      //   create: {
      //     width: 500,
      //     height: 500,
      //     channels: 3,
      //     background: { r: 255, g: 0, b: 0 },
      //   },
      // }) //.toBuffer();

      // const color = await sharp({
      //   create: {
      //     width: outputSize,
      //     height: outputSize,
      //     channels: 3,
      //     background: { r: 0, g: 0, b: 0 },
      //   },
      // })
      //   .extractChannel("green")
      //     .toColourspace('b-w')

      //   .toBuffer();

      //   .interpolateWith(sharp.interpolators.bicubic)
      //   .toFile(output, function (err) {
      //     // ...
      //     // console.log("finish", err);
      //   });

      const channels = getGS({
        width: outputSize,
        height: outputSize,
        colors: [layer.rgb.r, layer.rgb.g, layer.rgb.b],
      });

      const red = await sharp(channels[0], {
        raw: { width: outputSize, height: outputSize, channels: 1 },
      }).toBuffer();

      // const alphaImg = await sharp(channels[0], {
      //     raw: { width, height, channels: 1 },
      //   })

      const alphaImg = await sharp(channels[0], {
        raw: { width: outputSize, height: outputSize, channels: 1 },
      })
        .joinChannel(
          [
            // await sharp(channels[1], {
            //     raw: { width: outputSize, height: outputSize, channels: 1 },
            //   }),
            //   await    sharp(channels[2], {
            //     raw: { width: outputSize, height: outputSize, channels: 1 },
            //   }),
            channels[1], // new green channel
            channels[2], // new blue channel
          ],
          {
            raw: { width: outputSize, height: outputSize, channels: 1 },
          }
        )
        .joinChannel([
          // await sharp(channels[1], {
          //     raw: { width: outputSize, height: outputSize, channels: 1 },
          //   }),
          //   await    sharp(channels[2], {
          //     raw: { width: outputSize, height: outputSize, channels: 1 },
          //   }),
          // alpha, // new green channel
          // alpha, // new blue channel
          alpha, // new alpha channel
        ])
        .toColourspace("srgb")
        .toFile(output, function (err) {
          // ...
          console.log("finish", err);
        });
    });

    //   let commands = [];
    //   commands.push("convert");
    //   commands.push(`  ${layerPath}/${filename(item.name, item.id, "png")}`);
    //   commands.push("  \\( -clone 0 -alpha copy -channel A -negate \\)");
    //   commands.push("  -set colorspace CMYK");
    //   commands.push(
    //     `  \\( -clone 0 -fill "cmyk(${item.cmyk.c}%,${item.cmyk.m}%,${item.cmyk.y}%,${item.cmyk.k}%)" -draw 'color 0,0 reset' \\)`
    //   );
    //   commands.push("  -delete 0");
    //   commands.push("  -swap 0,1");
    //   commands.push("  -compose CopyOpacity -composite");
    //   commands.push(`  ${tempPath}/cmyk_${filename(item.name, item.id, "psd")}`);
    //   return commands.join(" \\\n  ");

    console.log(`finish ${layer.name}`);
  });
}

async function generateComposition() {
  // transcode all the layers to the right size

  outputSizes.forEach(async (outputSize) => {
    const output = `${tempPath}/${outputSize}_composition.png`;

    const base = await sharp({
      create: {
        width: outputSize,
        height: outputSize,
        channels: 4,
        background: { r: 0, g: 0, b: 0, alpha: 1 },
      },
    });
    //   .toColourspace("srgb")
    //   .toFile(output, function (err) {
    //     // ...
    //     // console.log("finish", err);
    //   });

    // const [first, ...rest] = [...layers].reverse().filter(filter);
    // const layersReverse = [...layers].reverse().slice(0, 2).reverse();
    const layersReverse = [...layers].reverse(); //.slice(0, 2).reverse();

    // layers.forEach(async (layer) => {
    const layerComposite = await layersReverse
      //   .slice(0, 2)
      .map(async (layer) => {
        // cycle through the sizes
        //   const input = `${layerPath}/${filename(layer.name, layer.id, "png")}`;
        const path = `${tempPath}/${outputSize}_${filename(
          layer.name,
          layer.id,
          "png"
        )}`;

        const input = await sharp(path)
          .composite([
            {
              input: Buffer.from([255, 255, 255, (255 * layer.opacity) / 100]),
              raw: {
                width: 1,
                height: 1,
                channels: 4,
              },
              tile: true,
              blend: "dest-in",
            },
          ])
          .raw()
          .toBuffer();
        //   .composite([
        //     {
        //       //   input: Buffer.from([255, 255, 255, 128]),
        //       input: await sharp({
        //         create: {
        //           width: outputSize,
        //           height: outputSize,
        //           channels: 4,
        //           background: { r: 255, g: 255, b: 255, alpha: 0.5 },
        //         },
        //       }).toBuffer(),
        //       raw: {
        //         width: outputSize,
        //         height: outputSize,
        //         channels: 4,
        //       },
        //       tile: true,
        //       blend: "dest-in",
        //     },
        //   ])

        // const metadata = await inFile.metadata();

        // console.log("---- meta channels", metadata);

        // const input = await inFile.toBuffer();

        const img = {
          input: input,
          blend: layer.blendMode === "multiply" ? "multiply" : "over",
          raw: { width: outputSize, height: outputSize, channels: 4 },
        };

        console.log(`ADD: ${path}`);

        return img;
      });

    const results = await Promise.all(layerComposite);
    // console.log(results);

    base.composite(results);

    await base.toColourspace("srgb").toFile(output, function (err) {
      // ...
      // console.log("finish", err);
    });

    console.log("finish", output);
  });
}

console.log("---- start generate colored layers");
// generateColors();
console.log("---- start generate composition");
generateComposition();

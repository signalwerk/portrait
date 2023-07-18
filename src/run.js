import fs from "fs";
import { join } from "path";
import sharp from "sharp";
import layers from "../data/layers.js";
import { generateGradient } from "./gradient-generate.js";

const dataPath = "./data";
const layerPath = `${dataPath}/layers`;
const finalPath = `./docs/illustration/2020`;
const tempPath = `${layerPath}/temp`;

const outputSizes = [8000, 6000, 4000, 3000, 2000, 1500, 1000, 500];

const filename = (name, index, extension = "psd") =>
  `${`${index}`.padStart(4, "0")}_${name}.${extension}`;

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

    channels.push(int8view);
  });

  return channels;
};

async function generateGradients() {
  layers.forEach(async (layer) => {
    outputSizes.forEach(async (outputSize) => {
      if (layer.type === "gradient") {
        const input = `${layerPath}/${filename(layer.name, layer.id, "json")}`;
        const output = `${tempPath}/${outputSize}_gradient_${filename(
          layer.name,
          layer.id,
          "png"
        )}`;
        generateGradient(
          input,
          output,
          outputSize,
          outputSize,
          (1 / 8000) * 8105
        );
      }
    });
  });
}

async function generateColors() {
  // transcode all the layers to the right size
  layers.forEach(async (layer) => {
    outputSizes.forEach(async (outputSize) => {
      let input = `${layerPath}/${filename(layer.name, layer.id, "png")}`;
      const output = `${tempPath}/${outputSize}_${filename(
        layer.name,
        layer.id,
        "png"
      )}`;

      if (layer.type === "gradient") {
        input = `${tempPath}/${outputSize}_gradient_${filename(
          layer.name,
          layer.id,
          "png"
        )}`;
      }

      const alpha = await sharp(input)
        .resize(outputSize, outputSize, {
          kernel: sharp.kernel.lanczos3,
          fit: "cover",
          position: "left top",
        })
        .sharpen(1, 0, 1)
        .negate()
        .toBuffer();

      const channels = getGS({
        width: outputSize,
        height: outputSize,
        colors: [layer.rgb.r, layer.rgb.g, layer.rgb.b],
      });

      const red = await sharp(channels[0], {
        raw: { width: outputSize, height: outputSize, channels: 1 },
      }).toBuffer();

      const alphaImg = await sharp(channels[0], {
        raw: { width: outputSize, height: outputSize, channels: 1 },
      })
        .joinChannel(
          [
            channels[1], // new green channel
            channels[2], // new blue channel
          ],
          {
            raw: { width: outputSize, height: outputSize, channels: 1 },
          }
        )
        .joinChannel([
          alpha, // new alpha channel
        ])
        .toColourspace("srgb")
        .toFile(output, function (err) {
          console.log(`  wrote ${layer.name}`);
        });
    });

    console.log(`finish ${layer.name}`);
  });
}

async function generateComposition() {
  outputSizes.forEach(async (outputSize) => {
    const outputPath = `${finalPath}/rgb/w${outputSize}/`;
    fs.mkdirSync(outputPath, { recursive: true });

    const output = `${outputPath}/stefan-huber`;

    const base = await sharp({
      create: {
        width: outputSize,
        height: outputSize,
        channels: 4,
        background: { r: 0, g: 0, b: 0, alpha: 1 },
      },
    });

    const layersReverse = [...layers].reverse();

    const layerComposite = await layersReverse.map(async (layer) => {
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

      const img = {
        input: input,
        premultiplied: layer.blendMode === "multiply",
        blend: layer.blendMode === "multiply" ? "multiply" : "over",
        raw: { width: outputSize, height: outputSize, channels: 4 },
      };

      console.log(`ADD: ${path}`);

      return img;
    });

    const results = await Promise.all(layerComposite);

    base.composite(results);

    await base
      .toColourspace("srgb")
      .png()
      .toFile(`${output}.png`, function (err) {});
    await base
      .toColourspace("srgb")
      .jpeg({
        quality: 75,
        mozjpeg: true,
      })
      .toFile(`${output}.jpg`, function (err) {});

    console.log("finish", output);
  });
}

var runArgs = process.argv.slice(2);

switch (runArgs[0]) {
  case "gradients":
    console.log("---- start generate gradients");
    await generateGradients();
    break;
  case "layers":
    console.log("---- start generate colored layers");
    await generateColors();
    break;
  case "compose":
    console.log("---- start generate composition");
    await generateComposition();
    break;
  default:
    console.log("⚠️ please use first layers han compose");
}

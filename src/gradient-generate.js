import { PNG } from "pngjs";
import fs from "fs";

export function generateGradient(
  input,
  output,
  width = 8000,
  height = 8105,
  yScale = 1
) {
  // read gradient stops from JSON file
  const stops = JSON.parse(fs.readFileSync(input, "utf-8")).map((item) => ({
    ...item,
    stop: item.stop * yScale,
  }));

  // create a new PNG image
  let image = new PNG({
    width,
    height,
    filterType: -1,
    colorType: 0, // This will create a grayscale image
    inputHasAlpha: false,
  });

  for (let y = 0; y < height; y++) {
    const t = y / (height - 1); // normalize y to [0, 1]

    // find the two stops t lies between
    let i = 0;
    while (i < stops.length - 1 && stops[i + 1].stop < t) {
      i++;
    }

    const t0 = stops[i].stop;
    const t1 = stops[i + 1].stop;
    const c0 = stops[i].color;
    const c1 = stops[i + 1].color;

    // linearly interpolate color
    const grayValue = Math.round(c0 + (c1 - c0) * ((t - t0) / (t1 - t0)));

    // set color of each pixel in this row
    for (let x = 0; x < width; x++) {
      const idx = (width * y + x) * 3;
      // Since it's grayscale, we only need to set one color component.
      image.data[idx] = grayValue;
      image.data[idx + 1] = grayValue;
      image.data[idx + 2] = grayValue;
    }
  }

  // save the image
  image.pack().pipe(fs.createWriteStream(output));
}

// generateGradient("./data/layers/0015_hg-yellow-gradient-1.json", "./data/layers/0015_hg-yellow-gradient-1.png");
// generateGradient("./data/layers/0011_hg-yellow-gradient-2.json", "./data/layers/0011_hg-yellow-gradient-2.png");

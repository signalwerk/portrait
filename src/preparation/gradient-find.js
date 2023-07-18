import sharp from "sharp";
import fs from "fs";

async function analyzeImage(imagePath, errorThreshold = 1.5) {
  const image = sharp(`./data/layers/${imagePath}-orig.png`);
  const metadata = await image.metadata();
  const height = metadata.height;
  const width = metadata.width;

  // Extract raw pixel data
  const rawPixelData = await image.raw().toBuffer();

  let brightnessValues = [];
  const segments = [];

  // Iterate over each row and take the red value of the first pixel
  for (let y = 0; y < height; y++) {
    const index = y * width * 3;
    const brightness = rawPixelData[index + 21]; // the first pixel row is not pure black, so we take the 7th pixel instead

    brightnessValues.push(brightness);
  }

  // Add the color of the first pixel
  segments.push({ stop: 0, color: brightnessValues[0] });

  // Perform gradient segmentation
  let data = [];

  // Find the first color change
  let startIndex = 0;
  while (
    startIndex < height - 1 &&
    brightnessValues[startIndex] === brightnessValues[startIndex + 1]
  ) {
    startIndex++;
  }

  // Find the last color change
  let endIndex = height - 1;
  while (
    endIndex > startIndex &&
    brightnessValues[endIndex] === brightnessValues[endIndex - 1]
  ) {
    endIndex--;
  }

  // Add the first segment (before the gradient starts)
  if (startIndex > 0) {
    const colorStart = brightnessValues[startIndex - 1];
    const stopStart = startIndex / height;
    segments.push({ stop: stopStart, color: colorStart });
  }

  // Perform gradient segmentation between the first and last color change
  for (let y = startIndex; y <= endIndex; y++) {
    data.push([y, brightnessValues[y]]);
    if (data.length > 1) {
      // now we check if the error is greater than the threshold
      const startBrightness = data[0][1];
      const endBrightness = data[data.length - 1][1];
      for (let i = 0; i <= data.length - 1; i++) {
        const currentBrightness = data[i][1];
        const calculatedBrightness =
          startBrightness +
          ((endBrightness - startBrightness) / (data.length - 1)) * i;
        const error = Math.abs(currentBrightness - calculatedBrightness);
        if (error > errorThreshold) {
          const colorEnd = brightnessValues[y - 1];
          segments.push({ stop: (y - 1) / height, color: colorEnd });
          data = [[y, brightnessValues[y]]];
        }
      }

      /*
      // Perform linear regression
      const result = regression.linear(data);
      const predictedBrightnessValue = result.predict(y)[1];
      const error = Math.abs(predictedBrightnessValue - brightnessValues[y]);

      // If the error exceeds the error threshold, perform regression and reset data
      if (error > errorThreshold) {
        const colorEnd = brightnessValues[y - 1];
        segments.push({ stop: (y - 1) / height, color: colorEnd });
        data = [[y, brightnessValues[y]]];
      }
      */
    }
  }

  // Add the last segment (after the gradient ends)
  if (endIndex < height - 1) {
    const colorEnd = brightnessValues[endIndex + 1];
    const stopEnd = (endIndex + 1) / height;
    segments.push({ stop: stopEnd, color: colorEnd });
  }

  // Calculate color for the last segment
  const colorEnd = brightnessValues[height - 1];
  segments.push({ stop: 1, color: colorEnd });

  // Write the gradients to a JSON file in a readable format
  fs.writeFileSync(
    `./data/layers/${imagePath}.json`,
    JSON.stringify(segments, null, 2)
  );

  // Write the gradients to a HTML file
  writeGradientToHtml(segments, imagePath);
}

function writeGradientToHtml(segments, imagePath) {
  const gradientPercentages = segments
    .map((segment, i) => {
      const color = Math.round((segment.color / 255) * 100);
      return `rgb(${color}%,${color}%,${color}%) ${segment.stop * 100}%`;
    })
    .join(", ");

  const html = `
        <!DOCTYPE html>
        <html>
        <head>
            <style>
                .container {
                    width: 1200px;
                    height: 1200px;
                    position: relative;
                }

                .container div {
                    width: 100%;
                    height: 100%;
                    position: absolute;
                    top: 0;
                    left: 0;
                }

                #gradientDiv {
                    background: linear-gradient(to bottom, ${gradientPercentages});
                    z-index: 2;
                }

                #imageDiv {
                    background: url('./${imagePath}-orig.png') no-repeat center center;
                    background-size: cover;
                    z-index: 1;
                }
            </style>
            <script>
                function toggleVisibility() {
                    const gradientDiv = document.getElementById('gradientDiv');
                    const imageDiv = document.getElementById('imageDiv');

                    if (gradientDiv.style.display === 'none') {
                        gradientDiv.style.display = 'block';
                        imageDiv.style.display = 'none';
                    } else {
                        gradientDiv.style.display = 'none';
                        imageDiv.style.display = 'block';
                    }
                }
            </script>
        </head>
        <body>
            <div class="container">
                <div id="gradientDiv"></div>
                <div id="imageDiv"></div>
            </div>
            <button onclick="toggleVisibility()">Toggle Visibility</button>
        </body>
        </html>
    `;

  fs.writeFileSync(`./data/layers/${imagePath}.html`, html);
}

analyzeImage("0015_hg-yellow-gradient-1");
analyzeImage("0011_hg-yellow-gradient-2");

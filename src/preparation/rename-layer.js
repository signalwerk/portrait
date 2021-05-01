try {
  // #target photoshop

  // Define the x and y coordinates for the pixel to sample.
  // Add a Color Sampler at a given x and y coordinate in the image.
  // var x = 1;
  // var y = 1;
  // var Colour = app.activeDocument.colorSamplers.add([x - 1, y - 1]);

  var Colour = app.foregroundColor;
  var Doc = app.activeDocument;
  var Layer = Doc.activeLayer;

  var labelName = Layer.name.split("--")[0];

  var blendMode = ("" + Layer.blendMode).split(".")[1].toLowerCase();

  // Obtain array of RGB values.
  var rgb = [
    Math.round(Colour.rgb.red),
    Math.round(Colour.rgb.green),
    Math.round(Colour.rgb.blue),
  ];

  // Obtain array of rounded CMYK values.
  var cmyk = [
    Math.round(Colour.cmyk.cyan),
    Math.round(Colour.cmyk.magenta),
    Math.round(Colour.cmyk.yellow),
    Math.round(Colour.cmyk.black),
  ];

  var opacity = Layer.opacity;

  // Remove the Color Sampler.
  // Colour.remove();

  // Display the complete RGB values and each component color.

  var layerLabel =
    labelName +
    "--blendMode-" +
    blendMode +
    "--opacity-" +
    opacity +
    "--rgb-" +
    rgb.join("-") +
    "--cmyk-" +
    cmyk.join("-");

  Layer.name = layerLabel;

  alert("label: " + layerLabel);
} catch (e) {
  alert(e);
}

try {
  var Colour = app.foregroundColor;
  var Doc = app.activeDocument;

  var layers = [];

  for (var i = 0; i < Doc.layers.length; i++) {
    var Layer = Doc.layers[i];
    layers.push(Layer.name);
    // Layer.name = Layer.name.split("--")[0];
  }

  alert(layers.join("||"));
} catch (e) {
  alert(e);
}

⚠️⚠️⚠️⚠️⚠️⚠️ attention!!! right end!!! stripe


## Preparation

## Photoshop
- `./data/portrait_cleanup.psd` renamed layers & general cleanup
- Export all layers (`File` → `Export` → `Layers to Files…`) to `./data/layers/`
- In all layer-files change opacity to `100%` and mode to `normal`
- Rename (temporarly) the layers with the help of `./src/preparation/rename-layer.js`
- Generate `./src/data/layers.json` with the help of `./src/preparation/extract-layer-data.js`


## Bash
* Go to `src` folder → `cd ./src`
* Generate generator file (`exec.sh`) for Image GMagic
* Run the generator file `sh exec.sh`

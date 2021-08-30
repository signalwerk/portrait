## Portrait

This repository contains a portrait of Stefan Huber. For details see [my Avatar-Page](https://avatar.signalwerk.ch).  
This illustration is made by [Benjamin Güdel](http://www.guedel.biz/) in June 2020.

## Generate

To generate all versions of the portraits go to `src` folder (`cd ./src`) and run the generator:

```sh
rm -rf ../data/layers/temp   # clean up old data
mkdir ../data/layers/temp

node run.js layers           # generate colored layers
node run.js compose          # compose layers
```
### Preparations in Photoshop

Based on the original Photoshop-File from the [artist](http://www.guedel.biz/) the following steps were executed:

- `./data/portrait_cleanup.psd` renamed layers & general cleanup
- Export all layers (`File` → `Export` → `Layers to Files…`) to `./data/layers/`
- Rename (temporarly) the layers with the help of `./src/preparation/rename-layer.js`
- Generate `./src/data/layers.json` with the help of `./src/preparation/extract-layer-data.js`
- In all layer-files change opacity to `100%` and mode to `normal`
- Generate from layer-files (`.psd`) 8-bit grayscale PNG `./src/preparation/create_png.sh`
- Fix the missing gradient in the right end of `0015_hg-yellow-gradient-1.png`
- Fix `0001_glow-yellow.png` based on `glow` layer of grayscale version

## Color Profiles

The colors are originally defined by the [artist](http://www.guedel.biz/) in the ICC-Profile `Generic CMYK Profile.icc` as absolute CMYK values. The generated TIFFs include this profiles. The generated PNGs don't include a profile but are defined in sRGB.  
The profile `Generic CMYK Profile.icc` is shipped with MacOS X from Apple in the Folder `/System/Library/ColorSync/Profiles/Generic CMYK Profile.icc`.

## Resampling

For more about resampling read the notes from [Nicolas Robidoux](https://legacy.imagemagick.org/Usage/filter/nicolas/) and [check](http://entropymine.com/resamplescope/notes/photoshop/) how Photoshop is doing it.

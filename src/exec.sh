
mkdir -p ./../data/layers/temp/

echo "generate layers GS"
convert \
    ../data/layers/0000_contour.png \
    \( -clone 0 -alpha copy -channel A -negate \) \
    -set colorspace gray \
    \( -clone 0 -fill "gray(0%)" -draw 'color 0,0 reset' \) \
    -delete 0 \
    -swap 0,1 \
    -compose CopyOpacity -composite \
    ../data/layers/temp/gs_0000_contour.psd

convert \
    ../data/layers/0002_glow.png \
    \( -clone 0 -alpha copy -channel A -negate \) \
    -set colorspace gray \
    \( -clone 0 -fill "gray(100%)" -draw 'color 0,0 reset' \) \
    -delete 0 \
    -swap 0,1 \
    -compose CopyOpacity -composite \
    ../data/layers/temp/gs_0002_glow.psd

convert \
    ../data/layers/0003_shade-contour.png \
    \( -clone 0 -alpha copy -channel A -negate \) \
    -set colorspace gray \
    \( -clone 0 -fill "gray(0%)" -draw 'color 0,0 reset' \) \
    -delete 0 \
    -swap 0,1 \
    -compose CopyOpacity -composite \
    ../data/layers/temp/gs_0003_shade-contour.psd

convert \
    ../data/layers/0004_shade.png \
    \( -clone 0 -alpha copy -channel A -negate \) \
    -set colorspace gray \
    \( -clone 0 -fill "gray(0%)" -draw 'color 0,0 reset' \) \
    -delete 0 \
    -swap 0,1 \
    -compose CopyOpacity -composite \
    ../data/layers/temp/gs_0004_shade.psd

convert \
    ../data/layers/0006_light-2.png \
    \( -clone 0 -alpha copy -channel A -negate \) \
    -set colorspace gray \
    \( -clone 0 -fill "gray(100%)" -draw 'color 0,0 reset' \) \
    -delete 0 \
    -swap 0,1 \
    -compose CopyOpacity -composite \
    ../data/layers/temp/gs_0006_light-2.psd

convert \
    ../data/layers/0008_light-1.png \
    \( -clone 0 -alpha copy -channel A -negate \) \
    -set colorspace gray \
    \( -clone 0 -fill "gray(100%)" -draw 'color 0,0 reset' \) \
    -delete 0 \
    -swap 0,1 \
    -compose CopyOpacity -composite \
    ../data/layers/temp/gs_0008_light-1.psd

convert \
    ../data/layers/0009_shirt.png \
    \( -clone 0 -alpha copy -channel A -negate \) \
    -set colorspace gray \
    \( -clone 0 -fill "gray(0%)" -draw 'color 0,0 reset' \) \
    -delete 0 \
    -swap 0,1 \
    -compose CopyOpacity -composite \
    ../data/layers/temp/gs_0009_shirt.psd

convert \
    ../data/layers/0010_silhouette.png \
    \( -clone 0 -alpha copy -channel A -negate \) \
    -set colorspace gray \
    \( -clone 0 -fill "gray(70%)" -draw 'color 0,0 reset' \) \
    -delete 0 \
    -swap 0,1 \
    -compose CopyOpacity -composite \
    ../data/layers/temp/gs_0010_silhouette.psd

convert \
    ../data/layers/0018_hg.png \
    \( -clone 0 -alpha copy -channel A -negate \) \
    -set colorspace gray \
    \( -clone 0 -fill "gray(57%)" -draw 'color 0,0 reset' \) \
    -delete 0 \
    -swap 0,1 \
    -compose CopyOpacity -composite \
    ../data/layers/temp/gs_0018_hg.psd

echo "generate layers CMYK"
convert \
    ../data/layers/0000_contour.png \
    \( -clone 0 -alpha copy -channel A -negate \) \
    -set colorspace CMYK \
    \( -clone 0 -fill "cmyk(78%,71%,60%,89%)" -draw 'color 0,0 reset' \) \
    -delete 0 \
    -swap 0,1 \
    -compose CopyOpacity -composite \
    ../data/layers/temp/cmyk_0000_contour.psd

convert \
    ../data/layers/0001_glow-yellow.png \
    \( -clone 0 -alpha copy -channel A -negate \) \
    -set colorspace CMYK \
    \( -clone 0 -fill "cmyk(3%,0%,68%,0%)" -draw 'color 0,0 reset' \) \
    -delete 0 \
    -swap 0,1 \
    -compose CopyOpacity -composite \
    ../data/layers/temp/cmyk_0001_glow-yellow.psd

convert \
    ../data/layers/0002_glow.png \
    \( -clone 0 -alpha copy -channel A -negate \) \
    -set colorspace CMYK \
    \( -clone 0 -fill "cmyk(1%,0%,2%,0%)" -draw 'color 0,0 reset' \) \
    -delete 0 \
    -swap 0,1 \
    -compose CopyOpacity -composite \
    ../data/layers/temp/cmyk_0002_glow.psd

convert \
    ../data/layers/0003_shade-contour.png \
    \( -clone 0 -alpha copy -channel A -negate \) \
    -set colorspace CMYK \
    \( -clone 0 -fill "cmyk(21%,11%,12%,20%)" -draw 'color 0,0 reset' \) \
    -delete 0 \
    -swap 0,1 \
    -compose CopyOpacity -composite \
    ../data/layers/temp/cmyk_0003_shade-contour.psd

convert \
    ../data/layers/0004_shade.png \
    \( -clone 0 -alpha copy -channel A -negate \) \
    -set colorspace CMYK \
    \( -clone 0 -fill "cmyk(33%,14%,2%,8%)" -draw 'color 0,0 reset' \) \
    -delete 0 \
    -swap 0,1 \
    -compose CopyOpacity -composite \
    ../data/layers/temp/cmyk_0004_shade.psd

convert \
    ../data/layers/0005_light-3.png \
    \( -clone 0 -alpha copy -channel A -negate \) \
    -set colorspace CMYK \
    \( -clone 0 -fill "cmyk(0%,0%,0%,0%)" -draw 'color 0,0 reset' \) \
    -delete 0 \
    -swap 0,1 \
    -compose CopyOpacity -composite \
    ../data/layers/temp/cmyk_0005_light-3.psd

convert \
    ../data/layers/0006_light-2.png \
    \( -clone 0 -alpha copy -channel A -negate \) \
    -set colorspace CMYK \
    \( -clone 0 -fill "cmyk(3%,0%,67%,0%)" -draw 'color 0,0 reset' \) \
    -delete 0 \
    -swap 0,1 \
    -compose CopyOpacity -composite \
    ../data/layers/temp/cmyk_0006_light-2.psd

convert \
    ../data/layers/0007_light-gradient.png \
    \( -clone 0 -alpha copy -channel A -negate \) \
    -set colorspace CMYK \
    \( -clone 0 -fill "cmyk(3%,0%,68%,0%)" -draw 'color 0,0 reset' \) \
    -delete 0 \
    -swap 0,1 \
    -compose CopyOpacity -composite \
    ../data/layers/temp/cmyk_0007_light-gradient.psd

convert \
    ../data/layers/0008_light-1.png \
    \( -clone 0 -alpha copy -channel A -negate \) \
    -set colorspace CMYK \
    \( -clone 0 -fill "cmyk(17%,9%,60%,0%)" -draw 'color 0,0 reset' \) \
    -delete 0 \
    -swap 0,1 \
    -compose CopyOpacity -composite \
    ../data/layers/temp/cmyk_0008_light-1.psd

convert \
    ../data/layers/0009_shirt.png \
    \( -clone 0 -alpha copy -channel A -negate \) \
    -set colorspace CMYK \
    \( -clone 0 -fill "cmyk(76%,71%,65%,81%)" -draw 'color 0,0 reset' \) \
    -delete 0 \
    -swap 0,1 \
    -compose CopyOpacity -composite \
    ../data/layers/temp/cmyk_0009_shirt.psd

convert \
    ../data/layers/0010_silhouette.png \
    \( -clone 0 -alpha copy -channel A -negate \) \
    -set colorspace CMYK \
    \( -clone 0 -fill "cmyk(38%,12%,67%,4%)" -draw 'color 0,0 reset' \) \
    -delete 0 \
    -swap 0,1 \
    -compose CopyOpacity -composite \
    ../data/layers/temp/cmyk_0010_silhouette.psd

convert \
    ../data/layers/0011_hg-yellow-gradient-2.png \
    \( -clone 0 -alpha copy -channel A -negate \) \
    -set colorspace CMYK \
    \( -clone 0 -fill "cmyk(3%,0%,68%,2%)" -draw 'color 0,0 reset' \) \
    -delete 0 \
    -swap 0,1 \
    -compose CopyOpacity -composite \
    ../data/layers/temp/cmyk_0011_hg-yellow-gradient-2.psd

convert \
    ../data/layers/0012_hg-wave-5.png \
    \( -clone 0 -alpha copy -channel A -negate \) \
    -set colorspace CMYK \
    \( -clone 0 -fill "cmyk(2%,0%,39%,0%)" -draw 'color 0,0 reset' \) \
    -delete 0 \
    -swap 0,1 \
    -compose CopyOpacity -composite \
    ../data/layers/temp/cmyk_0012_hg-wave-5.psd

convert \
    ../data/layers/0013_hg-wave-4.png \
    \( -clone 0 -alpha copy -channel A -negate \) \
    -set colorspace CMYK \
    \( -clone 0 -fill "cmyk(33%,14%,2%,16%)" -draw 'color 0,0 reset' \) \
    -delete 0 \
    -swap 0,1 \
    -compose CopyOpacity -composite \
    ../data/layers/temp/cmyk_0013_hg-wave-4.psd

convert \
    ../data/layers/0014_hg-wave-3.png \
    \( -clone 0 -alpha copy -channel A -negate \) \
    -set colorspace CMYK \
    \( -clone 0 -fill "cmyk(0%,0%,0%,0%)" -draw 'color 0,0 reset' \) \
    -delete 0 \
    -swap 0,1 \
    -compose CopyOpacity -composite \
    ../data/layers/temp/cmyk_0014_hg-wave-3.psd

convert \
    ../data/layers/0015_hg-yellow-gradient-1.png \
    \( -clone 0 -alpha copy -channel A -negate \) \
    -set colorspace CMYK \
    \( -clone 0 -fill "cmyk(3%,0%,68%,2%)" -draw 'color 0,0 reset' \) \
    -delete 0 \
    -swap 0,1 \
    -compose CopyOpacity -composite \
    ../data/layers/temp/cmyk_0015_hg-yellow-gradient-1.psd

convert \
    ../data/layers/0016_hg-wave-2.png \
    \( -clone 0 -alpha copy -channel A -negate \) \
    -set colorspace CMYK \
    \( -clone 0 -fill "cmyk(33%,14%,2%,16%)" -draw 'color 0,0 reset' \) \
    -delete 0 \
    -swap 0,1 \
    -compose CopyOpacity -composite \
    ../data/layers/temp/cmyk_0016_hg-wave-2.psd

convert \
    ../data/layers/0017_hg-wave-1.png \
    \( -clone 0 -alpha copy -channel A -negate \) \
    -set colorspace CMYK \
    \( -clone 0 -fill "cmyk(33%,14%,2%,16%)" -draw 'color 0,0 reset' \) \
    -delete 0 \
    -swap 0,1 \
    -compose CopyOpacity -composite \
    ../data/layers/temp/cmyk_0017_hg-wave-1.psd

convert \
    ../data/layers/0018_hg.png \
    \( -clone 0 -alpha copy -channel A -negate \) \
    -set colorspace CMYK \
    \( -clone 0 -fill "cmyk(51%,17%,68%,4%)" -draw 'color 0,0 reset' \) \
    -delete 0 \
    -swap 0,1 \
    -compose CopyOpacity -composite \
    ../data/layers/temp/cmyk_0018_hg.psd

echo "generate layers RGB"
convert \
    ../data/layers/0000_contour.png \
    \( -clone 0 -fill "rgb(0,0,4)" -draw 'color 0,0 reset' \) \
    \( -clone 0 -alpha copy -channel A -negate \) \
    -delete 0 \
    -compose CopyOpacity -composite \
    ../data/layers/temp/rgb_0000_contour.psd

convert \
    ../data/layers/0001_glow-yellow.png \
    \( -clone 0 -fill "rgb(249,240,116)" -draw 'color 0,0 reset' \) \
    \( -clone 0 -alpha copy -channel A -negate \) \
    -delete 0 \
    -compose CopyOpacity -composite \
    ../data/layers/temp/rgb_0001_glow-yellow.psd

convert \
    ../data/layers/0002_glow.png \
    \( -clone 0 -fill "rgb(252,253,249)" -draw 'color 0,0 reset' \) \
    \( -clone 0 -alpha copy -channel A -negate \) \
    -delete 0 \
    -compose CopyOpacity -composite \
    ../data/layers/temp/rgb_0002_glow.psd

convert \
    ../data/layers/0003_shade-contour.png \
    \( -clone 0 -fill "rgb(160,170,168)" -draw 'color 0,0 reset' \) \
    \( -clone 0 -alpha copy -channel A -negate \) \
    -delete 0 \
    -compose CopyOpacity -composite \
    ../data/layers/temp/rgb_0003_shade-contour.psd

convert \
    ../data/layers/0004_shade.png \
    \( -clone 0 -fill "rgb(152,177,199)" -draw 'color 0,0 reset' \) \
    \( -clone 0 -alpha copy -channel A -negate \) \
    -delete 0 \
    -compose CopyOpacity -composite \
    ../data/layers/temp/rgb_0004_shade.psd

convert \
    ../data/layers/0005_light-3.png \
    \( -clone 0 -fill "rgb(255,255,255)" -draw 'color 0,0 reset' \) \
    \( -clone 0 -alpha copy -channel A -negate \) \
    -delete 0 \
    -compose CopyOpacity -composite \
    ../data/layers/temp/rgb_0005_light-3.psd

convert \
    ../data/layers/0006_light-2.png \
    \( -clone 0 -fill "rgb(249,240,117)" -draw 'color 0,0 reset' \) \
    \( -clone 0 -alpha copy -channel A -negate \) \
    -delete 0 \
    -compose CopyOpacity -composite \
    ../data/layers/temp/rgb_0006_light-2.psd

convert \
    ../data/layers/0007_light-gradient.png \
    \( -clone 0 -fill "rgb(249,240,116)" -draw 'color 0,0 reset' \) \
    \( -clone 0 -alpha copy -channel A -negate \) \
    -delete 0 \
    -compose CopyOpacity -composite \
    ../data/layers/temp/rgb_0007_light-gradient.psd

convert \
    ../data/layers/0008_light-1.png \
    \( -clone 0 -fill "rgb(208,206,126)" -draw 'color 0,0 reset' \) \
    \( -clone 0 -alpha copy -channel A -negate \) \
    -delete 0 \
    -compose CopyOpacity -composite \
    ../data/layers/temp/rgb_0008_light-1.psd

convert \
    ../data/layers/0009_shirt.png \
    \( -clone 0 -fill "rgb(6,8,8)" -draw 'color 0,0 reset' \) \
    \( -clone 0 -alpha copy -channel A -negate \) \
    -delete 0 \
    -compose CopyOpacity -composite \
    ../data/layers/temp/rgb_0009_shirt.psd

convert \
    ../data/layers/0010_silhouette.png \
    \( -clone 0 -fill "rgb(152,175,109)" -draw 'color 0,0 reset' \) \
    \( -clone 0 -alpha copy -channel A -negate \) \
    -delete 0 \
    -compose CopyOpacity -composite \
    ../data/layers/temp/rgb_0010_silhouette.psd

convert \
    ../data/layers/0011_hg-yellow-gradient-2.png \
    \( -clone 0 -fill "rgb(244,235,114)" -draw 'color 0,0 reset' \) \
    \( -clone 0 -alpha copy -channel A -negate \) \
    -delete 0 \
    -compose CopyOpacity -composite \
    ../data/layers/temp/rgb_0011_hg-yellow-gradient-2.psd

convert \
    ../data/layers/0012_hg-wave-5.png \
    \( -clone 0 -fill "rgb(251,245,172)" -draw 'color 0,0 reset' \) \
    \( -clone 0 -alpha copy -channel A -negate \) \
    -delete 0 \
    -compose CopyOpacity -composite \
    ../data/layers/temp/rgb_0012_hg-wave-5.psd

convert \
    ../data/layers/0013_hg-wave-4.png \
    \( -clone 0 -fill "rgb(141,164,184)" -draw 'color 0,0 reset' \) \
    \( -clone 0 -alpha copy -channel A -negate \) \
    -delete 0 \
    -compose CopyOpacity -composite \
    ../data/layers/temp/rgb_0013_hg-wave-4.psd

convert \
    ../data/layers/0014_hg-wave-3.png \
    \( -clone 0 -fill "rgb(255,255,255)" -draw 'color 0,0 reset' \) \
    \( -clone 0 -alpha copy -channel A -negate \) \
    -delete 0 \
    -compose CopyOpacity -composite \
    ../data/layers/temp/rgb_0014_hg-wave-3.psd

convert \
    ../data/layers/0015_hg-yellow-gradient-1.png \
    \( -clone 0 -fill "rgb(244,235,114)" -draw 'color 0,0 reset' \) \
    \( -clone 0 -alpha copy -channel A -negate \) \
    -delete 0 \
    -compose CopyOpacity -composite \
    ../data/layers/temp/rgb_0015_hg-yellow-gradient-1.psd

convert \
    ../data/layers/0016_hg-wave-2.png \
    \( -clone 0 -fill "rgb(141,164,184)" -draw 'color 0,0 reset' \) \
    \( -clone 0 -alpha copy -channel A -negate \) \
    -delete 0 \
    -compose CopyOpacity -composite \
    ../data/layers/temp/rgb_0016_hg-wave-2.psd

convert \
    ../data/layers/0017_hg-wave-1.png \
    \( -clone 0 -fill "rgb(141,164,184)" -draw 'color 0,0 reset' \) \
    \( -clone 0 -alpha copy -channel A -negate \) \
    -delete 0 \
    -compose CopyOpacity -composite \
    ../data/layers/temp/rgb_0017_hg-wave-1.psd

convert \
    ../data/layers/0018_hg.png \
    \( -clone 0 -fill "rgb(123,160,106)" -draw 'color 0,0 reset' \) \
    \( -clone 0 -alpha copy -channel A -negate \) \
    -delete 0 \
    -compose CopyOpacity -composite \
    ../data/layers/temp/rgb_0018_hg.psd

echo "combine layers GS"
convert -respect-parenthesis  \
  \( ../data/layers/temp/gs_0018_hg.psd \) \
  \( ../data/layers/temp/gs_0010_silhouette.psd -delete 0 -compose Over -alpha set -channel a -evaluate multiply 1 \) \
  \( ../data/layers/temp/gs_0009_shirt.psd -delete 0 -compose Over -alpha set -channel a -evaluate multiply 0.51 \) \
  \( ../data/layers/temp/gs_0008_light-1.psd -delete 0 -compose Over -alpha set -channel a -evaluate multiply 0.5 \) \
  \( ../data/layers/temp/gs_0006_light-2.psd -delete 0 -compose Over -alpha set -channel a -evaluate multiply 1 \) \
  \( ../data/layers/temp/gs_0004_shade.psd -delete 0 -compose Multiply -alpha set -channel a -evaluate multiply 0.26 \) \
  \( ../data/layers/temp/gs_0003_shade-contour.psd -delete 0 -compose Multiply -alpha set -channel a -evaluate multiply 0.37 \) \
  \( ../data/layers/temp/gs_0002_glow.psd -delete 0 -compose Over -alpha set -channel a -evaluate multiply 1 \) \
  \( ../data/layers/temp/gs_0000_contour.psd -delete 0 -compose Over -alpha set -channel a -evaluate multiply 1 \) \
  ../data/portrait_generated_gs.psd

echo "combine layers CMYK"
convert -respect-parenthesis  \
  \( ../data/layers/temp/cmyk_0018_hg.psd \) \
  \( ../data/layers/temp/cmyk_0017_hg-wave-1.psd -delete 0 -compose Multiply -alpha set -channel a -evaluate multiply 0.95 \) \
  \( ../data/layers/temp/cmyk_0016_hg-wave-2.psd -delete 0 -compose Multiply -alpha set -channel a -evaluate multiply 1 \) \
  \( ../data/layers/temp/cmyk_0015_hg-yellow-gradient-1.psd -delete 0 -compose Over -alpha set -channel a -evaluate multiply 1 \) \
  \( ../data/layers/temp/cmyk_0014_hg-wave-3.psd -delete 0 -compose Over -alpha set -channel a -evaluate multiply 0.96 \) \
  \( ../data/layers/temp/cmyk_0013_hg-wave-4.psd -delete 0 -compose Multiply -alpha set -channel a -evaluate multiply 1 \) \
  \( ../data/layers/temp/cmyk_0012_hg-wave-5.psd -delete 0 -compose Over -alpha set -channel a -evaluate multiply 0.83 \) \
  \( ../data/layers/temp/cmyk_0011_hg-yellow-gradient-2.psd -delete 0 -compose Over -alpha set -channel a -evaluate multiply 0.65 \) \
  \( ../data/layers/temp/cmyk_0010_silhouette.psd -delete 0 -compose Over -alpha set -channel a -evaluate multiply 1 \) \
  \( ../data/layers/temp/cmyk_0009_shirt.psd -delete 0 -compose Over -alpha set -channel a -evaluate multiply 0.51 \) \
  \( ../data/layers/temp/cmyk_0008_light-1.psd -delete 0 -compose Over -alpha set -channel a -evaluate multiply 0.79 \) \
  \( ../data/layers/temp/cmyk_0007_light-gradient.psd -delete 0 -compose Over -alpha set -channel a -evaluate multiply 0.46 \) \
  \( ../data/layers/temp/cmyk_0006_light-2.psd -delete 0 -compose Over -alpha set -channel a -evaluate multiply 0.71 \) \
  \( ../data/layers/temp/cmyk_0005_light-3.psd -delete 0 -compose Over -alpha set -channel a -evaluate multiply 0.59 \) \
  \( ../data/layers/temp/cmyk_0004_shade.psd -delete 0 -compose Multiply -alpha set -channel a -evaluate multiply 1 \) \
  \( ../data/layers/temp/cmyk_0003_shade-contour.psd -delete 0 -compose Multiply -alpha set -channel a -evaluate multiply 1 \) \
  \( ../data/layers/temp/cmyk_0002_glow.psd -delete 0 -compose Over -alpha set -channel a -evaluate multiply 1 \) \
  \( ../data/layers/temp/cmyk_0001_glow-yellow.psd -delete 0 -compose Over -alpha set -channel a -evaluate multiply 1 \) \
  \( ../data/layers/temp/cmyk_0000_contour.psd -delete 0 -compose Over -alpha set -channel a -evaluate multiply 1 \) \
  ../data/portrait_generated_cmyk.psd

echo "combine layers RGB"
convert -respect-parenthesis  \
  \( ../data/layers/temp/rgb_0018_hg.psd \) \
  \( ../data/layers/temp/rgb_0017_hg-wave-1.psd -delete 0 -compose Multiply -alpha set -channel a -evaluate multiply 0.95 \) \
  \( ../data/layers/temp/rgb_0016_hg-wave-2.psd -delete 0 -compose Multiply -alpha set -channel a -evaluate multiply 1 \) \
  \( ../data/layers/temp/rgb_0015_hg-yellow-gradient-1.psd -delete 0 -compose Over -alpha set -channel a -evaluate multiply 1 \) \
  \( ../data/layers/temp/rgb_0014_hg-wave-3.psd -delete 0 -compose Over -alpha set -channel a -evaluate multiply 0.96 \) \
  \( ../data/layers/temp/rgb_0013_hg-wave-4.psd -delete 0 -compose Multiply -alpha set -channel a -evaluate multiply 1 \) \
  \( ../data/layers/temp/rgb_0012_hg-wave-5.psd -delete 0 -compose Over -alpha set -channel a -evaluate multiply 0.83 \) \
  \( ../data/layers/temp/rgb_0011_hg-yellow-gradient-2.psd -delete 0 -compose Over -alpha set -channel a -evaluate multiply 0.65 \) \
  \( ../data/layers/temp/rgb_0010_silhouette.psd -delete 0 -compose Over -alpha set -channel a -evaluate multiply 1 \) \
  \( ../data/layers/temp/rgb_0009_shirt.psd -delete 0 -compose Over -alpha set -channel a -evaluate multiply 0.51 \) \
  \( ../data/layers/temp/rgb_0008_light-1.psd -delete 0 -compose Over -alpha set -channel a -evaluate multiply 0.79 \) \
  \( ../data/layers/temp/rgb_0007_light-gradient.psd -delete 0 -compose Over -alpha set -channel a -evaluate multiply 0.46 \) \
  \( ../data/layers/temp/rgb_0006_light-2.psd -delete 0 -compose Over -alpha set -channel a -evaluate multiply 0.71 \) \
  \( ../data/layers/temp/rgb_0005_light-3.psd -delete 0 -compose Over -alpha set -channel a -evaluate multiply 0.59 \) \
  \( ../data/layers/temp/rgb_0004_shade.psd -delete 0 -compose Multiply -alpha set -channel a -evaluate multiply 1 \) \
  \( ../data/layers/temp/rgb_0003_shade-contour.psd -delete 0 -compose Multiply -alpha set -channel a -evaluate multiply 1 \) \
  \( ../data/layers/temp/rgb_0002_glow.psd -delete 0 -compose Over -alpha set -channel a -evaluate multiply 1 \) \
  \( ../data/layers/temp/rgb_0001_glow-yellow.psd -delete 0 -compose Over -alpha set -channel a -evaluate multiply 1 \) \
  \( ../data/layers/temp/rgb_0000_contour.psd -delete 0 -compose Over -alpha set -channel a -evaluate multiply 1 \) \
  ../data/portrait_generated_rgb.psd

echo "downscale GS"
convert ../data/portrait_generated_gs.psd  -crop 8000x8000 -profile "/System/Library/ColorSync/Profiles/Generic Gray Profile.icc" -compress LZW tiff64:../data/portrait_generated_8000_gs.tif
convert ../data/portrait_generated_gs.psd -resize 6000x -crop 6000x6000 -profile "/System/Library/ColorSync/Profiles/Generic Gray Profile.icc" -compress LZW tiff64:../data/portrait_generated_6000_gs.tif
convert ../data/portrait_generated_gs.psd -resize 4000x -crop 4000x4000 -profile "/System/Library/ColorSync/Profiles/Generic Gray Profile.icc" -compress LZW tiff64:../data/portrait_generated_4000_gs.tif
convert ../data/portrait_generated_gs.psd -resize 3000x -crop 3000x3000 -profile "/System/Library/ColorSync/Profiles/Generic Gray Profile.icc" -compress LZW tiff64:../data/portrait_generated_3000_gs.tif
convert ../data/portrait_generated_gs.psd -resize 2000x -crop 2000x2000 -profile "/System/Library/ColorSync/Profiles/Generic Gray Profile.icc" -compress LZW tiff64:../data/portrait_generated_2000_gs.tif
convert ../data/portrait_generated_gs.psd -resize 1500x -crop 1500x1500 -profile "/System/Library/ColorSync/Profiles/Generic Gray Profile.icc" -compress LZW tiff64:../data/portrait_generated_1500_gs.tif
convert ../data/portrait_generated_gs.psd -resize 1000x -crop 1000x1000 -profile "/System/Library/ColorSync/Profiles/Generic Gray Profile.icc" -compress LZW tiff64:../data/portrait_generated_1000_gs.tif
convert ../data/portrait_generated_gs.psd -resize 500x -crop 500x500 -profile "/System/Library/ColorSync/Profiles/Generic Gray Profile.icc" -compress LZW tiff64:../data/portrait_generated_500_gs.tif

echo "downscale CMYK"
convert ../data/portrait_generated_cmyk.psd  -crop 8000x8000 -profile "/System/Library/ColorSync/Profiles/Generic CMYK Profile.icc" -compress LZW tiff64:../data/portrait_generated_8000_cmyk.tif
convert ../data/portrait_generated_cmyk.psd -resize 6000x -crop 6000x6000 -profile "/System/Library/ColorSync/Profiles/Generic CMYK Profile.icc" -compress LZW tiff64:../data/portrait_generated_6000_cmyk.tif
convert ../data/portrait_generated_cmyk.psd -resize 4000x -crop 4000x4000 -profile "/System/Library/ColorSync/Profiles/Generic CMYK Profile.icc" -compress LZW tiff64:../data/portrait_generated_4000_cmyk.tif
convert ../data/portrait_generated_cmyk.psd -resize 3000x -crop 3000x3000 -profile "/System/Library/ColorSync/Profiles/Generic CMYK Profile.icc" -compress LZW tiff64:../data/portrait_generated_3000_cmyk.tif
convert ../data/portrait_generated_cmyk.psd -resize 2000x -crop 2000x2000 -profile "/System/Library/ColorSync/Profiles/Generic CMYK Profile.icc" -compress LZW tiff64:../data/portrait_generated_2000_cmyk.tif
convert ../data/portrait_generated_cmyk.psd -resize 1500x -crop 1500x1500 -profile "/System/Library/ColorSync/Profiles/Generic CMYK Profile.icc" -compress LZW tiff64:../data/portrait_generated_1500_cmyk.tif
convert ../data/portrait_generated_cmyk.psd -resize 1000x -crop 1000x1000 -profile "/System/Library/ColorSync/Profiles/Generic CMYK Profile.icc" -compress LZW tiff64:../data/portrait_generated_1000_cmyk.tif
convert ../data/portrait_generated_cmyk.psd -resize 500x -crop 500x500 -profile "/System/Library/ColorSync/Profiles/Generic CMYK Profile.icc" -compress LZW tiff64:../data/portrait_generated_500_cmyk.tif

echo "downscale RGB (sRGB no Profile)"
convert ../data/portrait_generated_rgb.psd  -crop 8000x8000  ../data/portrait_generated_8000_rgb.png
convert ../data/portrait_generated_rgb.psd -resize 6000x -crop 6000x6000  ../data/portrait_generated_6000_rgb.png
convert ../data/portrait_generated_rgb.psd -resize 4000x -crop 4000x4000  ../data/portrait_generated_4000_rgb.png
convert ../data/portrait_generated_rgb.psd -resize 3000x -crop 3000x3000  ../data/portrait_generated_3000_rgb.png
convert ../data/portrait_generated_rgb.psd -resize 2000x -crop 2000x2000  ../data/portrait_generated_2000_rgb.png
convert ../data/portrait_generated_rgb.psd -resize 1500x -crop 1500x1500  ../data/portrait_generated_1500_rgb.png
convert ../data/portrait_generated_rgb.psd -resize 1000x -crop 1000x1000  ../data/portrait_generated_1000_rgb.png
convert ../data/portrait_generated_rgb.psd -resize 500x -crop 500x500  ../data/portrait_generated_500_rgb.png

# rm -rf ./../data/layers/temp/

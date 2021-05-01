convert -respect-parenthesis  \
  \( ../data/layers/_0018_hg.psd \) \
  \( ../data/layers/_0017_hg-wave-1.psd -delete 0 -compose Multiply -alpha set -channel a -evaluate multiply 0.95 \) \
  \( ../data/layers/_0016_hg-wave-2.psd -delete 0 -compose Multiply -alpha set -channel a -evaluate multiply 1 \) \
  \( ../data/layers/_0015_hg-yellow-gradient-1.psd -delete 0 -compose Over -alpha set -channel a -evaluate multiply 1 \) \
  \( ../data/layers/_0014_hg-wave-3.psd -delete 0 -compose Over -alpha set -channel a -evaluate multiply 0.96 \) \
  \( ../data/layers/_0013_hg-wave-4.psd -delete 0 -compose Multiply -alpha set -channel a -evaluate multiply 1 \) \
  \( ../data/layers/_0012_hg-wave-5.psd -delete 0 -compose Over -alpha set -channel a -evaluate multiply 0.83 \) \
  \( ../data/layers/_0011_hg-yellow-gradient-2.psd -delete 0 -compose Over -alpha set -channel a -evaluate multiply 0.65 \) \
  \( ../data/layers/_0010_silhouette.psd -delete 0 -compose Over -alpha set -channel a -evaluate multiply 1 \) \
  \( ../data/layers/_0009_shirt.psd -delete 0 -compose Over -alpha set -channel a -evaluate multiply 0.51 \) \
  \( ../data/layers/_0008_light-1.psd -delete 0 -compose Over -alpha set -channel a -evaluate multiply 0.79 \) \
  \( ../data/layers/_0007_light-gradient.psd -delete 0 -compose Over -alpha set -channel a -evaluate multiply 0.46 \) \
  \( ../data/layers/_0006_light-2.psd -delete 0 -compose Over -alpha set -channel a -evaluate multiply 0.71 \) \
  \( ../data/layers/_0005_light-3.psd -delete 0 -compose Over -alpha set -channel a -evaluate multiply 0.59 \) \
  \( ../data/layers/_0004_shade.psd -delete 0 -compose Multiply -alpha set -channel a -evaluate multiply 1 \) \
  \( ../data/layers/_0003_shade-contour.psd -delete 0 -compose Multiply -alpha set -channel a -evaluate multiply 1 \) \
  \( ../data/layers/_0002_glow.psd -delete 0 -compose Over -alpha set -channel a -evaluate multiply 1 \) \
  \( ../data/layers/_0001_glow-yellow.psd -delete 0 -compose Over -alpha set -channel a -evaluate multiply 1 \) \
  \( ../data/layers/_0000_contour.psd -delete 0 -compose Over -alpha set -channel a -evaluate multiply 1 \) \
  result.psd
#!/bin/bash

# 480p (720 x 480)
# 720p (1280 x 720)
# 1080p (1900 x 1080)
# 4k (3840 x 2160)
# 8k (7680 x 4320)

# exemple of ffmpeg command for 1 file :
# ffmpeg -i in.mp4 -vf scale=320:-1 320pxWidthOut.mp4

mkdir ../mp4_w480

for f in *.mp4 ; do ffmpeg -i "$f" -vf scale=480:-1 "../mp4_w480/$f" ;  done

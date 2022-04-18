#!/bin/bash

pathToVideos=$1
maxWidth=$2
outputFolder="output"

if [ -z "$pathToVideos" ]
then
      echo "\$pathToVideos is empty"

      echo ""
      echo "Exemple of valid command for max width of 320px --> ./resize.sh ~/my/videos/directory 320"

      echo ""
      echo "480p (720 x 480)"
      echo "720p (1280 x 720)"
      echo "1080p (1900 x 1080)"
      echo "4k (3840 x 2160)"
      echo "8k (7680 x 4320)"

      echo ""
      echo "Exemple of ffmpeg command used in this script for 1 file :"
      echo "ffmpeg -i in.mp4 -vf scale=320:-1 320pxWidthOut.mp4"

else
      if [ -z "$maxWidth" ]
      then
            echo "\$maxWidth is empty"
            maxWidth="320"
            echo "\$maxWidth is now $maxWidth"
      else
            echo "\$maxWidth is NOT empty"
            echo "\$maxWidth is $maxWidth"
      fi

      echo "makedir $pathToVideos/$maxWidth"
      mkdir "$pathToVideos/$maxWidth"

      echo ""
      echo "cd $pathToVideos"
      cd $pathToVideos

      echo ""
      echo "pwd"
      pwd

      echo ""
      echo "Looping thrue files."
      for f in *.mp4 ; 
      do 
            echo ""
            echo $f ;  
            echo "./$maxWidth/$f" ; 

            echo ""
            echo ""
            echo "ffmpeg -i '$f' -vf scale=$maxWidth:-1 './$maxWidth/$f' "
            echo ""
            echo ""
            ffmpeg -i "$f" -vf scale=$maxWidth:-1 "./$maxWidth/$f" ;
      done

      echo "Done !"
fi

#!/bin/bash

SOURCE_FOLDER=$(pwd)
DEST_FOLDER=/home/$(basename $SOURCE_FOLDER)

if [ -z "$ET_HOSTNAME" ]; then
  ET_HOSTNAME=epitest
fi

docker run --rm -v "$SOURCE_FOLDER:$DEST_FOLDER" -w $DEST_FOLDER -h $ET_HOSTNAME -it epitest fish

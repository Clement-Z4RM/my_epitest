#!/bin/bash

if [ -z "$ET_HOSTNAME" ]; then
  if [ -z "$HOSTNAME" ]; then
    ET_HOSTNAME="epitest"
  else
    ET_HOSTNAME="$HOSTNAME"
  fi
fi

if [ -z "$ET_PROMPT" ]; then
  ET_PROMPT="nim"
fi

SOURCE_FOLDER=$(pwd)
DEST_FOLDER=/home/$ET_HOSTNAME/$(basename $SOURCE_FOLDER)

CONTAINER_NAME=epitest_$(date +%s)

docker run -d --name $CONTAINER_NAME --rm -v "$SOURCE_FOLDER:$DEST_FOLDER" -w $DEST_FOLDER -h $ET_HOSTNAME -it epitest > /dev/null

if [ -f ~/.config/fish/config.fish ]; then
  docker exec $CONTAINER_NAME mkdir -p /home/$ET_HOSTNAME/.config/fish/

  docker cp -q ~/.config/fish/config.fish $CONTAINER_NAME:/home/$ET_HOSTNAME/.config/fish/config.fish

  docker exec -it $CONTAINER_NAME fish -C "source /home/$ET_HOSTNAME/.config/fish/config.fish && fish_config prompt choose $ET_PROMPT"
fi

docker exec -it $CONTAINER_NAME fish -C "fish_config prompt choose $ET_PROMPT"

docker stop $CONTAINER_NAME > /dev/null &

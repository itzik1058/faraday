#!/usr/bin/env bash

cd $(dirname $(realpath $0))
source .env
export RESTIC_PASSWORD=$RESTIC_PASSWORD
systemctl stop docker
sudo -E restic -r $RESTIC_REPOSITORY --verbose backup \
	--exclude $MEDIA_PATH/downloads \
	--exclude $MEDIA_PATH/media/tv \
	--exclude $MEDIA_PATH/media/movies \
	$MEDIA_PATH $DATA_PATH
systemctl start docker

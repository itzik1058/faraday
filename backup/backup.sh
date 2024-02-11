#!/usr/bin/env bash

cd $(dirname $(realpath $0))
source .env
source ../.env
export RESTIC_PASSWORD=$RESTIC_PASSWORD
systemctl stop docker
sudo -E restic -r $RESTIC_REPOSITORY --verbose backup \
	--exclude $USER_DATA_PATH/downloads \
	--exclude $USER_DATA_PATH/media/tv \
	--exclude $USER_DATA_PATH/media/movies \
	$USER_DATA_PATH $APP_CONFIG_PATH $APP_DATA_PATH
systemctl start docker

#!/bin/sh

IMAGE_PATH="/mnt/SDCARD/App/CloudSync/syncing.png"
IMAGE_SUCC="/mnt/SDCARD/App/CloudSync/success.png"
IMAGE_FAIL="/mnt/SDCARD/App/CloudSync/failed.png"

show "$IMAGE_PATH" &

./command.sh && (show "$IMAGE_SUCC" & sleep 3)  || (show "$IMAGE_FAIL" & sleep 3)

killall -9 show
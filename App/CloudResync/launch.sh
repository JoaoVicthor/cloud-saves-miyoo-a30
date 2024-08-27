#!/bin/sh

IMAGE_PATH="/mnt/SDCARD/App/CloudResync/resyncing.png"
IMAGE_SUCC="/mnt/SDCARD/App/CloudResync/success.png"
IMAGE_FAIL="/mnt/SDCARD/App/CloudResync/failed.png"

show "$IMAGE_PATH" &

./command.sh && (show "$IMAGE_SUCC" & sleep 3)  || (show "$IMAGE_FAIL" & sleep 3)

killall -9 show
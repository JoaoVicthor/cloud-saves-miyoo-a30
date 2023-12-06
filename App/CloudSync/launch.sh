#!/bin/sh
echo $0 $*
LD_PRELOAD=/mnt/SDCARD/miyoo/lib/libpadsp.so /mnt/SDCARD/.tmp_update/bin/infoPanel -t "Syncing saves" -m "Save syncing in progress..." --auto &

cd $(dirname "$0")
LD_PRELOAD=/mnt/SDCARD/miyoo/lib/libpadsp.so ./command.sh && /mnt/SDCARD/.tmp_update/bin/infoPanel -t "Syncing saves" -m "Saves synced successfully!" --auto || /mnt/SDCARD/.tmp_update/bin/infoPanel -t "Syncing saves" -m "Save syncing failed!"


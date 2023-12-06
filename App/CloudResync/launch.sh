#!/bin/sh
echo $0 $*
LD_PRELOAD=/mnt/SDCARD/miyoo/lib/libpadsp.so /mnt/SDCARD/.tmp_update/bin/infoPanel -t "Resyncing saves" -m "Save resyncing in progress..." --auto &

cd $(dirname "$0")

LD_PRELOAD=/mnt/SDCARD/miyoo/lib/libpadsp.so ./command.sh && /mnt/SDCARD/.tmp_update/bin/infoPanel -t "Resyncing saves" -m "Saves resynced successfully!" --auto || /mnt/SDCARD/.tmp_update/bin/infoPanel -t "Resyncing saves" -m "Save resyncing failed!"

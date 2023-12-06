cp update_networking.patch /mnt/SDCARD/.tmp_update/script/network
cd /mnt/SDCARD/.tmp_update/script/network
patch -R update_networking.sh < update_networking.patch
rm update_networking.patch
cd -

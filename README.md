# Cloud Saves for the Miyoo A30

![Main Apps UI](https://github.com/user-attachments/assets/46753b86-4274-495b-a9aa-b8b6414dd07f?raw=true)

Utilizing rclone, synchronize saves between your Miyoo A30 and any cloud storage service like Google Drive, MEGA, Dropbox, OneDrive, etc.

## Apps

### CloudSync
From official documentation:

Perform bidirectional synchronization between two paths.

Bisync provides a bidirectional cloud sync solution in rclone. It retains the Path1 and Path2 filesystem listings from the prior run. On each successive run it will:

- list files on Path1 and Path2, and check for changes on each side. Changes include New, Newer, Older, and Deleted files.
- Propagate changes on Path1 to Path2, and vice-versa.

### CloudResync
This should ideally only be used when setting up cloud saves for the first time.

Also from official doc:

This will effectively make both Path1 and Path2 filesystems contain a matching superset of all files. Path2 files that do not exist in Path1 will be copied to Path1, and the process will then copy the Path1 tree to Path2.

The base directories on both Path1 and Path2 filesystems must exist or bisync will fail. This is required for safety - that bisync can verify that both paths are valid.

**Be careful with possible data loss**
When using --resync, a newer version of a file on the Path2 filesystem will be overwritten by the Path1 filesystem version.

The --resync sequence is roughly equivalent to:

rclone copy Path2 Path1 --ignore-existing
rclone copy Path1 Path2

This means that when running Resync, files existing on the device and not on cloud will be copied remotely while files on your device that also exist on the cloud will be overwritten.


## Pre-requisities
- Wifi enabled;
- The latest `ARMv7 - 32 Bit` version of rclone, available [here](https://downloads.rclone.org/v1.67.0/rclone-v1.67.0-linux-arm-v7.zip).

## Installation

0. If you already have an `rclone.conf` file from another installation, you can throw it in the root of your SD card and skip steps 3 and 4. Be sure to open the file in a text editor and rename whichever remote you want to use from `[remote name]` to `[cloud]`.

1. Drag the `App` folder from this repo to the root of your SD card;
2. Drag the `rclone` file with no extension from the rclone for [Linux ARMv7 download](https://downloads.rclone.org/v1.67.0/rclone-v1.67.0-linux-arm-v7.zip) also to the root of your SD card;
3. SSH into your Miyoo A30 or use `adb shell`;
4. Run `/mnt/SDCARD/rclone config --config /mnt/SDCARD/rclone.conf` and name your remote `cloud`. Follow the steps. When it asks `Use web browser to automatically authenticate rclone with remote?`, type `n`;
5. Add `chunk_size = 16Mi` to your `/mnt/SDCARD/rclone.conf` file, or your Miyoo A30 may run out of memory;
6. Edit `CloudResync/command.sh` and `CloudSync/command.sh` with your desired cloud paths (`cloud:desired/path`);
7. You will need to run `CloudResync` at least once to build the cache since [bisync is a stateful method](https://rclone.org/bisync/).


All of these apps are powered by simple Linux commands. Feel free to edit them how you see fit. 

Remember you can always connect to your A30 using a terminal and run the according `command.sh` script to see the output.

[Thanks hotcereal for starting this!](https://github.com/hotcereal/cloud-saves-miyoo-mini-plus)
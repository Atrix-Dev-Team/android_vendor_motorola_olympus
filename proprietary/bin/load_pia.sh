#!/system/bin/sh
export PATH=/system/bin:$PATH

device=/dev/block/mmcblk0p17
name=/preinstall
log=/data/preinstall.log

# p17 : mount preinstall
/system/bin/mount_pia.sh -r -t ext3 -o noatime -o nodiratime $device $name > $log

# Start loading preinstall
if [ -f /preinstall/resized ]; then
   /system/bin/loadpreinstalls.sh 
fi

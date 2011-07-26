#!/system/bin/sh
export PATH=/system/bin:$PATH

mountargs=$1
count=5

while [ ! -z $2 ]
do
   mountargs="$mountargs $2"
   device=$1
   mountpt=$2
   shift
done

echo mount arguments are $mountargs
echo device is $device, mountpt is $mountpt

while [ $count -ne 0 ]; do
  mount $mountargs
  error=$?

  if [ $error -eq 255 ]; then
    echo Device $device is busy, retrying...
    sleep 1
    count=$(($count-1))
  else
    break
  fi
done

if [ $count -eq 0 ]; then
  echo Device $device is busy
  exit 1
fi

if [ $error -ne 0 ]; then
   echo Mount problem $error
   umount $mountpt
   e2fsck -p $device
   tune2fs -j $device
   echo Done checking disk.
   mount $mountargs
fi

if [ ! -f $mountpt/resized ]; then
   echo preinstall needs to be resized.
   umount $mountpt
   e2fsck -f -p $device
   resize2fs $device
   echo done resizing!
   mount -rw -t ext3 $device $mountpt
   echo "resize done" > $mountpt/resized
   chmod 660 $mountpt/resized
   umount $mountpt
   mount $mountargs
fi

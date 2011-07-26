#!/system/bin/sh
export PATH=/system/bin:$PATH
PRELOAD_APP_DIR=/system/preinstall/app
PRELOAD_HASH_DIR=/system/preinstall/md5
DATA_HASH_DIR=/data/preinstall_md5
PRELOAD_DONE_PROP=preinstall.done
PRELOAD_LOG_FILE=$DATA_HASH_DIR/log.txt

mkdir $DATA_HASH_DIR

unzip_needed=1
for file in `ls $PRELOAD_APP_DIR`; do
    echo $file | busybox grep bell_gameloft_resources.zip 
    ret=$?
    if [ $ret -eq 0 ]; then
       if [ -d "/data/gameloft" ]; then
          if [ -f "/data/gameloft/done.txt" ]; then
              unzip_needed=0
          else
              echo "Gameloft resources corrupted. Script will try again"
              echo "Gameloft resources corrupted. Script will try again" >> $PRELOAD_LOG_FILE
              rm -R /data/gameloft
              unzip_needed=1
          fi  
       fi
    
       if [ $unzip_needed -eq 0 ]; then
            echo "Gameloft resources already installed. Exiting"
            echo "Gameloft resources already installed. Exiting" >> $PRELOAD_LOG_FILE
       else
            echo "$file: Found on ${PRELOAD_APP_DIR}/"
            echo "$file: Found on ${PRELOAD_APP_DIR}/" >> $PRELOAD_LOG_FILE
            now=`date`
            echo "Unzipping gameloft resources started: $now" 
            echo "Unzipping gameloft resources started: $now" >> $PRELOAD_LOG_FILE
            busybox unzip $PRELOAD_APP_DIR/$file -d /data
            ret=$?
            if [ $ret -ne 0 ]; then
               echo "Install of gameloft apks failed: $ret" 
               echo "Install of gameloft apks failed: $ret" >> $PRELOAD_LOG_FILE
            else
               echo "Install of gameloft apks done!"
               echo "Install of gameloft apks done!" >> $PRELOAD_LOG_FILE
               echo "done" > /data/gameloft/done.txt
            fi
            now=`date`
            echo "Unzipping gameloft ended: $now "
            echo "Unzipping gameloft ended: $now " >> $PRELOAD_LOG_FILE
       fi
    else
       echo "$file: comparing $PRELOAD_HASH_DIR/$file.md5 and $DATA_HASH_DIR/$file.md5"
       echo "$file: comparing $PRELOAD_HASH_DIR/$file.md5 and $DATA_HASH_DIR/$file.md5" >> $PRELOAD_LOG_FILE
       newMD5=`cat $PRELOAD_HASH_DIR/$file.md5`
       oldMD5=`cat $DATA_HASH_DIR/$file.md5`
       if [ "$newMD5" != "$oldMD5" ]; then
           isInstalled=`pm path $file`
           # app not installed, but md5 exists = user uninstalled app, do nothing
           if [ -z "$isInstalled" -a -e "$DATA_HASH_DIR/$file.md5" ]; then
               echo "$file: user has uninstalled, dont reinstall. copying $file.md5 to $DATA_HASH_DIR"
               echo "$file: user has uninstalled, dont reinstall. copying $file.md5 to $DATA_HASH_DIR" >> $PRELOAD_LOG_FILE
               cp $PRELOAD_HASH_DIR/$file.md5 $DATA_HASH_DIR
           else
               # app is installed, but md5 changed, uninstall first but keep users data
               if [ -n "$isInstalled" ]; then
                   for count in 1 2 3 4 5
                   do
                       pm uninstall -k $file
                       isInstalled=`pm path $file`
                       if [ -n "$isInstalled" ]; then
                           echo "$file: uninstall attempt $count of 5 failed"
                           echo "$file: uninstall attempt $count of 5 failed" >> $PRELOAD_LOG_FILE
                           sleep 5
                       else
                           echo "$file: uninstall successful, user data kept"
                           echo "$file: uninstall successful, user data kept" >> $PRELOAD_LOG_FILE
                           break
                       fi
                   done
               fi
   
               isInstalled=`pm path $file`
               # app should not be installed at this point, either it never was installed, or it changed
               # and we uninstalled the old version above
               if [ -z "$isInstalled" ]; then
                   for count in 1 2 3 4 5
                   do
                       pm install $PRELOAD_APP_DIR/$file
   
                       isInstalled=`pm path $file`
                       if [ -z "$isInstalled" ]; then
                           echo "$file: install attempt $count of 5 failed"
                           echo "$file: install attempt $count of 5 failed" >> $PRELOAD_LOG_FILE
                           sleep 5
                       else
                           echo "$file: install successful, copying $file.md5 to $DATA_HASH_DIR"
                           echo "$file: install successful, copying $file.md5 to $DATA_HASH_DIR" >> $PRELOAD_LOG_FILE
                           cp $PRELOAD_HASH_DIR/$file.md5 $DATA_HASH_DIR
                           break
                       fi
                   done
               else
                   echo "$file: file still installed when it shouldnt be!"
                   echo "$file: file still installed when it shouldnt be!" >> $PRELOAD_LOG_FILE
               fi
           fi
       else
           echo "$file: install skipped, file unchanged"
           echo "$file: install skipped, file unchanged" >> $PRELOAD_LOG_FILE
       fi
   fi
done

retries=10
echo "preinstall finished, setting $PRELOAD_DONE_PROP to 1"
echo "preinstall finished, setting $PRELOAD_DONE_PROP to 1" >> $PRELOAD_LOG_FILE
setprop $PRELOAD_DONE_PROP 1
readback=`getprop $PRELOAD_DONE_PROP`
while [ "$readback" != "1" -a $retries -gt 0 ]
do
    echo "  property readback failed! expected 1, got $readback. retries left $retries..."
    echo "  property readback failed! expected 1, got $readback. retries left $retries..." >> $PRELOAD_LOG_FILE
    retries=$(($retries-1))
    sleep 2
    setprop $PRELOAD_DONE_PROP 1
    readback=`getprop $PRELOAD_DONE_PROP`
done

echo "preinstall exiting..."
echo "preinstall exiting..." >> $PRELOAD_LOG_FILE

#/usr/bin/env sh

# For cronjob notification showing compatibility
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus

# For callling itself
PROGNAME=$0

# Carry out rsync followed by zip -FS to create a synced compressed version
# A compressed version is useful when doing system restores
DIR_LIST="/home/workboots/Utilities/zip_dir.txt"

if [ $(mount | grep -c /mnt/media) != 1 ]
then
    if [ $(blkid | grep -c $UUID) == 1 ]
    then
        sudo mount -U $UUID /mnt/media
        $PROGNAME
        sudo umount /mnt/media
    else
        notify-send -u critical "Zip-based Data Backup" "External device not mounted. Please mount and run data backup."
    fi
else
	# Creating backup
	notify-send -u normal "Zip-based Data Backup" "Running backup."

    while read line
    do
        IFS=' ' read -ra ADDR <<< $line
        SRC=${ADDR[0]}
        DEST=${ADDR[1]}

        SRC_DIR=$(basename ${SRC})
        DEST_PATH=$(dirname ${DEST})

        cd ${SRC}
        cd ..

        date > "${DEST_PATH}/${SRC_DIR}.log"
        zip -FS9r ${DEST} ${SRC_DIR} >> "${DEST_PATH}/${SRC_DIR}.log"

    done < ${DIR_LIST}
	notify-send -u critical "Zip-based Data Backup" "Backup complete. Please check the log."
fi

exit 0

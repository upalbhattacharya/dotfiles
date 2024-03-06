#!/usr/bin/env sh
# For cronjob notification showing compatibility
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus

# For callling itself
PROGNAME=$0
# CHECK if external drive is mounted
UUID="2254E86E54E845DF"
DATE="$(date "+%Y%m%d")"
HOSTNAME="$(uname -n)"

# if [ $(mount | grep -c /mnt/media) != 1 ]
# then
#     if [ $(sudo blkid | grep -c $UUID) == 1 ]
#     then
#         sudo mount -U $UUID /mnt/media
#         $PROGNAME
#         sudo umount /mnt/media
#     else
#         notify-send -u critical "Data Backup" "External device not mounted. Please mount and run data backup."
#     fi
# else
	# Creating backup
notify-send -u normal "Data Backup" "Running backup."
rsync -avzrP -h --stats --delete \
      --log-file=/mnt/media/backup_logs/${HOSTNAME}_bckp_${DATE}.log \
  --files-from=/home/workboots/Utilities/rsync_files.txt \
  / /mnt/media/backups/$HOSTNAME
notify-send -u critical "Data Backup" "Backup complete. Please check the log."
# fi

exit 0


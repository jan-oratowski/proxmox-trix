#!/bin/bash
fstrim -a
sleep 2s
sgdisk --backup=/tmp/$HOSTNAME-sda.gpt /dev/sda
dd if=/dev/sda1 of=/tmp/$HOSTNAME-sda1.img
dd if=/dev/sda2 of=/tmp/$HOSTNAME-sda2.img
7zz a /mnt/pve/ds1515-backups/nodes/$HOSTNAME-sda_$(date +%F).7z /tmp/$HOSTNAME-sda*
rm /tmp/$HOSTNAME-sda*
lvcreate -L 1G -s -n snap /dev/pve/root
sleep 5s
dd if=/dev/mapper/pve-snap | gzip -c > /mnt/pve/ds1515-backups/nodes/$HOSTNAME-snapshot_$(date +%F).img.gz
sleep 5s
lvremove --yes /dev/pve/snap
find /mnt/pve/ds1515-backups/nodes/$HOSTNAME-*.7z -mtime +28 -type f -delete
find /mnt/pve/ds1515-backups/nodes/$HOSTNAME-*.gz -mtime +28 -type f -delete
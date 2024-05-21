sgdisk --load-backup=pve1-sda.gpt /dev/sda
dd of=/dev/sda1 if=pve1-sda1.img status=progress bs=256M
dd of=/dev/sda2 if=pve1-sda2.img status=progress bs=256M

# create pve vg

pvcreate /dev/sda3
vcgreate /dev/sda3 -npve
lvcreate pve -nroot -L40G
lvcreate pve -ntmp -L5G
lvcreate pve -nstorage -L10G
lvcreate pve -nswap -L16G
mke2fs.ext4 /dev/mapper/pve-tmp
mke2fs.ext4 /dev/mapper/pve-storage
mkswap /dev/mapper/pve-swap
dd of=/dev/mapper/pve-root if=pve1-snapshot.img status=progress bs=256M
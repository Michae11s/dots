#!/bin/bash
#creates a standard barebones setup, run in standard live media

#set date time
timedatectl set-ntp true

#do the partitioning
echo "do partitioning now"
echo "create /dev/sda1 as boot partition, /dev/sda2 as swap, /dev/sda3 as file system"
echo "part type EF00=efi, EF02 as bios boot, part type 8200=swap"
gdisk
mkfs.fat -F32 /dev/sda1
mkswap /dev/sda2
mkfs.ext4 /dev/sda3
swapon /dev/sda2
mount /dev/sda3 /mnt
mkdir /mnt/efi
mount /dev/sda1 /mnt/efi 

#pacstrap base base-devel
pacstrap /mnt base base-devel linux linux-firmware vim

#gen fstab
genfstab -U /mnt >> /mnt/etc/fstab

cp -r root/* /mnt/
cp pkglist /mnt/
cp installp2.sh /mnt/

arch-chroot /mnt

#!/bin/bash
#creates a standard barebones setup, run in standard live media
# Part 2::run inside chroot as SU

#copy system level config
cp /dots/etc/* /etc/

#locale gen
ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime
hwclock --systohc
locale-gen

#get the hostname
echo "ENTER THE DESIRED HOSTNAME:"
read HNAME
echo $HNAME > /etc/hostname
echo "127.0.0.1	"$HNAME >> /etc/hosts

#run initramfs again
mkinitcpio -P

#cheange the root passwd
echo "Change the root passwd"
passwd

#install suplimental packages
pacman -Syu --noconfirm $(cat /dots/pkglist)

#install bootloader
mkdir /boot/grub
grub-mkconfig -o /boot/grub/grub.cfg
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB
systemctl enable dhcpcd

### POST INSTALL CUSTOMIZATIONS ###
# create a user
echo "Enter desired user name:"
read UNAME
useradd -m -U --groups wheel,adm,rfkill,uucp -s /bin/bash $UNAME
passwd $UNAME

su $UNAME -c "/dots/ip3.sh"
rm -r /dots


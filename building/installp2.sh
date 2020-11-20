#!/bin/bash
#creates a standard barebones setup, run in standard live media

#run inside chroot
ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime
hwclock --systohc
locale-gen

#get the hostname
echo "ENTER THE DESIRED HOSTNAME:"
read HNAME
echo $HNAME > /etc/hostname
echo $HNAME >> /etc/hosts

#run initramfs again
mkinitcpio -P

#cheange the root passwd
echo "Change the root passwd"
passwd

### POST INSTALL CUSTOMIZATIONS ###
# create a user
echo "Enter desired user name:"
read UNAME
useradd -m -U --groups wheel,adm,rfkill,uucp -s /bin/bash $UNAME
passwd $UNAME
cd /home/$UNAME
mkdir ./bin
mkdir ./build
mkdir ./Documents
mkdir ./Downloads
mv /home/newUser /home/$UNAME
chown $UNAME -r /home/$UNAME

#install suplimental packages
pacman -S $(cat /pkglist)
rm /pkglist

#build auracle
cd /home/$UNAME/build
su $UNAME -c "git clone https://aur.archlinux.org/auracle-git.git"
cd auracle-git
su $UNAME -c "makepkg -si"

#install bootloader
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

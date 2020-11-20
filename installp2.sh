#!/bin/bash
#creates a standard barebones setup, run in standard live media


#run inside chroot
git clone https://github.com/Michae11s/dots.git
cp /dots/etc/* /etc/

#locale gen
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
cp -r /dots/.config ./
mv .config/bash/.bash_profile ./
mv .config/bash/.bashrc ./
rm -r .config/bash
chown $UNAME:$UNAME -R /home/$UNAME

#install suplimental packages
pacman -Syu $(cat /dots/pkglist)

#build auracle
cd /home/$UNAME/build
su $UNAME -c "git clone https://aur.archlinux.org/auracle-git.git"
cd auracle-git
su $UNAME -c "makepkg -si"

#install bootloader
mkdir /boot/grub
grub-mkconfig -o /boot/grub/grub.cfg
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB

cd /home/$UNAME/build
su $UNAME -c "git clone https://github.com/Michae11s/dots.git"
su $UNAME -c "git config --global credential.helper store"

systemctl enable dhcpcd

echo "Now back to you in the studio"

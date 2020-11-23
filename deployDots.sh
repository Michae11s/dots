#!/bin/bash
list="neofetch i3 polybar picom alacritty rofi flavours dunst"
#deploys dot files to where they need to go
for i in $list; do
	rm -r ~/.config/$i
	ln -s $(pwd)/.config/$i ~/.config/$i
done

rm ~/.bashrc ~/.bash_profile ~/.profile ~/.xsessionrc
ln -s $(pwd)/.config/bash/.bashrc ~/
ln -s $(pwd)/.config/bash/.bash_profile ~/
ln -s $(pwd)/.config/bash/.profile ~/
ln -s $(pwd)/.config/base/.xsessionrc ~/

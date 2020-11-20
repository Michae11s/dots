#!/bin/bash
list="neofetch i3 polybar picom alacritty"
#deploys dot files to where they need to go
for i in $list; do
	rm ~/.config/$i
	ln -s $(pwd)/.config/$i ~/.config/$i
done

rm ~/.bashrc ~/.bash_profile
ln -s $(pwd)/.config/bash/.bashrc ~/
ln -s $(pwd)/.config/bash/.bash_profile ~/

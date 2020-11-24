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
ln -s $(pwd)/.config/bash/.xsessionrc ~/

#flavours config polybar
mkdir -p ~/.local/share/flavours/base16/templates/polybar/templates/
rm ~/.local/share/flavours/base16/templates/polybar/templates/default.mustache
ln -s $(pwd)/.config/flavours/polybar/default.mustache ~/.local/share/flavours/base16/templates/polybar/templates/

#flavouts config dunst
mkdir -p ~/.local/share/flavours/base16/templates/dunst/templates/
rm ~/.local/share/flavours/base16/templates/dunst/templates/custom.mustache
ln -s $(pwd)/.config/flavours/dunst/custom.mustache ~/.local/share/flavours/base16/templates/dunst/templates/

#flavours config spicetify
mkdir -p ~/.local/share/flavours/base16/templates/spicetify/templates/
rm ~/.local/share/flavours/base16/templates/spicetify/templates/default.mustache
ln -s $(pwd)/.config/flavours/spicetify/default.mustache ~/.local/share/flavours/base16/templates/spicetify/templates/default.mustache

#flavours config rofi
mkdir -p ~/.local/share/flavours/base16/templates/rofi/templates/
rm ~/.local/share/flavours/base16/templates/rofi/templates/Kustomcolors.mustache
ln -s $(pwd)/.config/flavours/rofi/Kustomcolors.mustache ~/.local/share/flavours/base16/templates/rofi/templates/Kustomcolors.mustache

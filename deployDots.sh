#!/bin/bash
list="neofetch i3 polybar picom alacritty rofi flavours dunst UMS i3lock fontconfig"
#deploys dot files to where they need to go
for i in $list; do
	rm -r ~/.config/$i
	ln -s $(pwd)/.config/$i ~/.config/$i
done

#systemd
if [[ ! -f ~/.config/systemd ]]; then
	rm -r ~/.config/systemd
	ln -sf $(pwd)/.config/systemd ~/.config/systemd
fi
systemctl --user enable --now paperChanger.timer


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

#flavours config i3lock
mkdir -p ~/.local/share/flavours/base16/templates/i3lock/templates/
rm ~/.local/share/flavours/base16/templates/i3lock/templates/default.mustache
ln -s $(pwd)/.config/flavours/i3lock/default.mustache ~/.local/share/flavours/base16/templates/i3lock/templates/default.mustache

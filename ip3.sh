#!/bin/bash
# runs as newuser to deploy all settings

cd ~/
mkdir ~/.local
mkdir ~/.local/bin
ln -s ~/.local/bin/ ~/bin
mkdir ~/build
xdg-user-dirs-update

#build auracle
cd ~/build
git clone https://aur.archlinux.org/auracle-git.git
cd auracle-git
makepkg -si -noconfirm

cd ~/build
git config --global credential.helper store
git clone https://github.com/Michae11s/dots.git
cd ~/build/dots
./deployDots.sh

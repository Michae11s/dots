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
makepkg -si

#build pacUpdt (script neofetch uses to get pacman updates pending)
cd ~/build/
git clone https://github.com/Michae11s/pacUpdt.git
cd pacUpdt/
makepkg -si
sudo systemctl enable pacUpdt.timer

# deploy dotfiles
cd ~/build
git config --global credential.helper store
git clone https://github.com/Michae11s/dots.git
cd ~/build/dots
./deployDots.sh

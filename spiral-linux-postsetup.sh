#! /bin/bash

sudo apt update
sudo apt purge --auto-remove parcellite catfish gnome-software* lxqt-archiver mousepad xfce4-* simple-scan evince clementine vlc drawing libreoffice-* shotwell pidgin thunderbird transmission-* hplip* xserver-xorg-input-joystick
sudo apt install featherpad kdeconnect xcompmgr xscreensaver geoclue-2.0 qps flatpak redshift-gtk flameshot engrampa papirus-icon-theme fonts-noto* caffeine plank wget
sudo apt install --install-recommends plasma-discover plasma-discover-backend-flatpak 
sudo flatpak remote-delete flathub --system
flatpak remote-add --if-not-exists --user flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo apt dist-upgrade --auto-remove
flatpak update
git clone https://github.com/catppuccin/lxqt
git clone https://github.com/catppuccin/openbox
git clone https://github.com/catppuccin/plank
sudo mv lxqt/src/catppuccin-mocha /usr/share/lxqt/themes
mkdir ~/.themes
mv openbox/Catppuccin-Mocha ~/.themes
mkdir ~/.local/share/plank
mkdir ~/.local/share/plank/themes
mv plank/src/Catppuccin-mocha ~/.local/share/plank/themes
git clone https://github.com/catppuccin/papirus-folders
sudo cp -r papirus-folders/src/* /usr/share/icons/Papirus
./papirus-folders -C cat-mocha-mauve --theme Papirus-Dark
wget https://github.com/catppuccin/gtk/releases/download/v0.7.0/Catppuccin-Mocha-Standard-Mauve-Dark.zip
unzip Catppuccin-Mocha-Standard-Mauve-Dark.zip
mv Catppuccin-Mocha-Standard-Mauve-Dark* ~/.themes

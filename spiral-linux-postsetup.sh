#! /bin/bash

sudo apt update
sudo apt purge --auto-remove kate gwenview kolourpaint okular skanlite parcellite catfish gnome-software* lxqt-archiver mousepad xfce4-* simple-scan evince clementine vlc drawing libreoffice-* shotwell pidgin thunderbird transmission-* hplip* xserver-xorg-input-joystick
sudo apt install featherpad kdeconnect xcompmgr xscreensaver geoclue-2.0 qps flatpak redshift-gtk flameshot engrampa papirus-icon-theme fonts-noto* caffeine plank wget
sudo apt install --install-recommends plasma-discover plasma-discover-backend-flatpak 
sudo flatpak remote-delete flathub --system
flatpak remote-add --if-not-exists --user flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo apt dist-upgrade --auto-remove
flatpak update

#!/bin/bash

clearScreen(){
    clear
}

updateSystem(){
    sudo apt update
    clearScreen
}

installPackages(){
    sudo apt install lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings smplayer smplayer-themes cantata mpd mpv youtube-dl synaptic eject bash-completion gvfs* qt5-style-plugins network-manager nm-tray kde-spectacle xinit pulseaudio alsa-utils ark xserver-xorg xdg-user-dirs wpasupplicant xserver-xorg-video-intel firmware-amd-graphics fonts-noto* arc-theme papirus-icon-theme breeze-cursor-theme flatpak desktop-base caffeine xscreensaver lxqt-core kwrite lximage-qt lxqt-sudo pavucontrol-qt qps lm-sensors linux-cpupower tlp powertop openbox obconf-qt kcalc package-update-indicator git lxqt-powermanagement --no-install-recommends --no-install-suggests -y
    sudo apt install --instal-recommends plasma-discover plasma-discover-backend-flatpak flatpak -y
    clearScreen
}

setupFlatpak(){
    sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    clearScreen
}

updateSystem && installPackages && setupFlatpak && echo "All compents ran successfully!" || echo "One or More Components failed to run."
read -n 1 -s -r -p "Press any key to exit..."

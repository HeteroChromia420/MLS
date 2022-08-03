#!/bin/bash

clearScreen(){
    clear
}

updateSystem(){
    sudo apt update
    clearScreen
}

installPackages(){
    sudo apt install firefox-esr smplayer cantata mpd mpv youtube-dl synaptic eject bash-completion gvfs* plasma-nm kde-spectacle xinit pulseaudio alsa-utils ark gwenview kate xserver-xorg xdg-user-dirs wpasupplicant gimp xserver-xorg-video-nouveau fonts-noto* geoclue-2.0 arc-theme kdeconnect papirus-icon-theme breeze-cursor-theme desktop-base kde-config-gtk-style kde-config-screenlocker khotkeys kinfocenter kmenuedit kscreen qps kio-extras kwin-x11 powerdevil systemsettings kde-plasma-desktop plasma-pa kwalletmanager qml-module-org-kde-newstuff qml-module-org-kde-activities kactivities-bin ffmpegthumbs lightdm lightdm-gtk-greeter-settings  --no-install-recommends --no-install-suggests -y --no-install-recommends --no-install-suggests -y
    sudo apt install --instal-recommends plasma-discover plasma-discover-backend-flatpak flatpak -y
    clearScreen
}

setupFlatpak(){
    sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    clearScreen
}

updateSystem && installPackages && setupFlatpak && echo "All compents ran successfully!" || echo "One or More Components failed to run."
read -n 1 -s -r -p "Press any key to exit..."

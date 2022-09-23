#!/bin/bash

clearScreen(){
    clear
}

updateSystem(){
    sudo apt update | tee -a kqss-setup.log
    sudo apt upgrade -y | tee -a kqss-setup.log
    clearScreen
}

installPackages(){
    sudo apt install firefox-esr smplayer cantata mpd mpv youtube-dl synaptic eject bash-completion gvfs* plasma-nm kde-spectacle xinit pulseaudio alsa-utils ark gwenview kate xserver-xorg xdg-user-dirs wpasupplicant gimp xserver-xorg-video-nouveau fonts-noto* geoclue-2.0 arc-theme kdeconnect papirus-icon-theme breeze-cursor-theme desktop-base kde-config-gtk-style kde-config-screenlocker khotkeys kinfocenter kmenuedit kscreen qps kio-extras kwin-x11 powerdevil systemsettings kde-plasma-desktop plasma-pa kwalletmanager qml-module-org-kde-newstuff qml-module-org-kde-activities kactivities-bin ffmpegthumbs lightdm lightdm-gtk-greeter-settings --no-install-recommends --no-install-suggests -y | tee -a kqss-setup.log
    sudo apt install --instal-recommends plasma-discover plasma-discover-backend-flatpak flatpak -y
    #And Purge unwanted packages
    sudo apt purge --auto-remove unattended-upgrades snapd plasma-discover-backend-snap -y | tee -a kqss-setup.log
    clearScreen
}

setupFlatpak(){
    sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo | tee -a kqss-setup.log
    clearScreen
}

updateSystem && installPackages && setupFlatpak && echo "All compents ran successfully. Feel Free to check kqss-setup.log." || echo "One or More Components failed to run. Please check kqss-setup.log."
read -n 1 -s -r -p "Press any key to exit..."

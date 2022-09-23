#!/bin/bash

clearScreen(){
    clear
}

updateSystem(){
    sudo apt update | tee -a lqss-setup.log
    sudo apt upgrade -y | tee -a lqss-setup.log
    clearScreen
}

installPackages(){
    sudo apt install lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings smplayer smplayer-themes cantata mpd mpv youtube-dl synaptic eject bash-completion gvfs* qt5-style-plugins network-manager nm-tray kde-spectacle xinit pulseaudio alsa-utils ark xserver-xorg xdg-user-dirs wpasupplicant xserver-xorg-video-intel firmware-amd-graphics fonts-noto* arc-theme papirus-icon-theme breeze-cursor-theme flatpak desktop-base caffeine xscreensaver lxqt-core kwrite lximage-qt lxqt-sudo pavucontrol-qt qps lm-sensors linux-cpupower tlp powertop openbox obconf-qt kcalc package-update-indicator git lxqt-powermanagement --no-install-recommends --no-install-suggests -y | tee -a lqss-setup.log
    sudo apt install --instal-recommends plasma-discover plasma-discover-backend-flatpak flatpak -y | tee -a lqss-setup.log
    #And Purge unwanted packages
    sudo apt purge --auto-remove unattended-upgrades snapd plasma-discover-backend-snap -y | tee -a lqss-setup.log
    clearScreen
}

setupFlatpak(){
    sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo | tee -a lqss-setup.log
    clearScreen
}

setupExtra(){
    git clone https://gitlab.com/isseigx/lxqt-arc-dark-theme | tee -a lqss-setup.log
    sudo cp -r lxqt-arc-dark-theme/arc-dark/ /usr/share/lxqt/themes/ | tee -a lqss-setup.log
    clearScreen
}

updateSystem && installPackages && setupFlatpak && setupExtra && echo "All compents ran successfully. Feel Free to check lqss-setup.log." || echo "One or More Components failed to run. Please check lqss-setup.log."
read -n 1 -s -r -p "Press any key to exit..."

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
    sudo apt install libnotify4 pulseaudio pavucontrol-qt xcompmgr tumbler ffmpegthumbnailer slim synaptic eject bash-completion gvfs* qt5-style-plugins network-manager nm-tray kde-spectacle xinit alsa-utils lxqt-archiver xserver-xorg xdg-user-dirs wpasupplicant fonts-noto* arc-theme papirus-icon-theme breeze-cursor-theme flatpak desktop-base xscreensaver lxqt-core featherpad lximage-qt lxqt-sudo qps openbox obconf-qt kcalc package-update-indicator git lxqt-powermanagement --no-install-recommends --no-install-suggests -y | tee -a lqss-setup.log
    sudo apt install --install-recommends plasma-discover plasma-discover-backend-flatpak flatpak -y | tee -a lqss-setup.log
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
    git clone https://github.com/dglava/arc-openbox | tee -a obqss-setup.log
    cp -r arc-openbox/* ~/.themes | tee -a obqss-setup.log
    rm -rf arc-openbox | tee -a obqss-setup.log
}

updateSystem && installPackages && setupFlatpak && setupExtra && echo "All compents ran successfully. Feel Free to check lqss-setup.log." || echo "One or More Components failed to run. Please check lqss-setup.log."
read -n 1 -s -r -p "Press any key to exit..."

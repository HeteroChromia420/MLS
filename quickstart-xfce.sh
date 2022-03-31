#! /bin/bash

clear
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install curl aria2 wget ca-certificates gpg --no-install-recommends --no-install-suggests -y
/bin/bash -c "$(curl -sL https://git.io/vokNn)"
sudo apt-fast install openvpn qt5ct xfce4-terminal lightdm lightdm-gtk-greeter-settings celluloid ario mpd mpv youtube-dl synaptic eject bash-completion gvfs* qt5-style-plugins network-manager network-manager-gnome xfce4-screenshooter xinit pulseaudio alsa-utils file-roller xserver-xorg xdg-user-dirs wpasupplicant gimp fonts-noto* arc-theme kdeconnect papirus-icon-theme breeze-cursor-theme steam flatpak desktop-base caffeine xscreensaver xfce4 mousepad ristretto policykit-1 policykit-1-gnome pavucontrol xfce4-panel xfce4-whiskermenu-plugin xfce4-pulseaudio-plugin xfce4-taskmanager xfce4-notifyd xfwm4 gnome-calculator package-update-indicator git --no-install-recommends --no-install-suggests -y
xdg-user-dirs-update
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak install adriconf
sudo cp 50-mouse-acceleration.conf /usr/share/X11/xorg.conf.d/
cp .mpdconf ~/

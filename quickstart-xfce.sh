#! /bin/bash

clear
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install curl aria2 wget ca-certificates gpg --no-install-recommends --no-install-suggests -y
/bin/bash -c "$(curl -sL https://git.io/vokNn)"
sudo apt-fast install openvpn qt5ct xfce4-terminal lightdm lightdm-gtk-greeter-settings celluloid cantata mpd mpv youtube-dl synaptic eject bash-completion gvfs* qt5-style-plugins network-manager network-manager-gnome xfce4-screenshooter xinit pulseaudio alsa-utils file-roller xserver-xorg xdg-user-dirs wpasupplicant gimp fonts-noto* arc-theme kdeconnect breeze-cursor-theme steam flatpak desktop-base caffeine xscreensaver xfce4 mousepad ristretto policykit-1 policykit-1-gnome pavucontrol xfce4-panel xfce4-whiskermenu-plugin xfce4-pulseaudio-plugin xfce4-taskmanager xfce4-notifyd xfwm4 gnome-calculator package-update-indicator git --no-install-recommends --no-install-suggests -y
xdg-user-dirs-update
wget -qO- https://git.io/papirus-icon-theme-install | sh
wget -qO- https://git.io/papirus-folders-install | sh
echo "deb [arch=amd64] http://deb.librewolf.net bullseye main" | sudo tee /etc/apt/sources.list.d/librewolf.list
sudo wget https://deb.librewolf.net/keyring.gpg -O /etc/apt/trusted.gpg.d/librewolf.gpg
sudo apt update
sudo apt install librewolf -y
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak install adriconf
sudo cp 50-mouse-acceleration.conf /usr/share/X11/xorg.conf.d/
sudo cp 69-sysctl-performance.conf /etc/sysctl.d/
cp .mpdconf ~/

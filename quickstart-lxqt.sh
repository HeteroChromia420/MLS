#! /bin/bash

clear
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install curl aria2 wget ca-certificates gpg --no-install-recommends --no-install-suggests -y
echo 'deb http://download.opensuse.org/repositories/home:/ungoogled_chromium/Debian_Buster/ /' | sudo tee /etc/apt/sources.list.d/home-ungoogled_chromium.list > /dev/null
curl -s 'https://download.opensuse.org/repositories/home:/ungoogled_chromium/Debian_Buster/Release.key' | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home-ungoogled_chromium.gpg > /dev/null
/bin/bash -c "$(curl -sL https://git.io/vokNn)"
sudo apt-fast install lightdm lightdm-gtk-greeter-settings smplayer cantata mpd mpv youtube-dl synaptic eject bash-completion gvfs* qt5-style-plugins network-manager network-manager-gnome xfce4-screenshooter xinit pulseaudio alsa-utils ark xserver-xorg xdg-user-dirs wpasupplicant gimp xserver-xorg-video-intel firmware-amd-graphics fonts-noto* redshift-gtk geoclue-2.0 arc-theme kdeconnect papirus-icon-theme breeze-cursor-theme steam flatpak desktop-base caffeine xscreensaver lxqt-core kwrite lximage-qt lxqt-powermanagement lxqt-sudo pavucontrol-qt qps lm-sensors linux-cpupower tlp powertop xfce4-notifyd xfwm4 kcalc package-update-indicator plank --no-install-recommends --no-install-suggests -y
xdg-user-dirs-update
cp .mpdconf ~/
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak install adriconf
sudo apt-fast install -y openvpn dialog python3-pip python3-setuptools -y --no-install-recommends --no-install-suggests
sudo pip3 install protonvpn-cli

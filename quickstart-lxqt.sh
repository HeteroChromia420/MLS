#! /bin/bash

clear
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install curl aria2 wget ca-certificates gpg --no-install-recommends --no-install-suggests -y
/bin/bash -c "$(curl -sL https://git.io/vokNn)"
sudo apt-fast install sddm smplayer smplayer-themes cantata mpd mpv youtube-dl synaptic eject bash-completion gvfs* qt5-style-plugins network-manager nm-tray flameshot xinit pulseaudio alsa-utils ark xserver-xorg xdg-user-dirs wpasupplicant gimp xserver-xorg-video-intel firmware-amd-graphics fonts-noto* arc-theme kdeconnect papirus-icon-theme breeze-cursor-theme steam flatpak desktop-base caffeine xscreensaver lxqt-core kwrite lximage-qt lxqt-sudo pavucontrol-qt qps lm-sensors linux-cpupower tlp powertop openbox obconf-qt kcalc package-update-indicator plank git lxqt-powermanagement --no-install-recommends --no-install-suggests -y
xdg-user-dirs-update
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak install adriconf
sudo apt-fast install -y openvpn network-manager-openvpn -y --no-install-recommends --no-install-suggests
git clone https://gitlab.com/isseigx/lxqt-arc-dark-theme
sudo apt update
sudo cp -r lxqt-arc-dark-theme/arc-dark/ /usr/share/lxqt/themes/
sudo cp 50-mouse-acceleration.conf /usr/share/X11/xorg.conf.d/
sudo cp 69-sysctl-performance.conf /etc/sysctl.d/
cp .mpdconf ~/

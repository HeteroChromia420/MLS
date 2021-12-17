#! /bin/bash

clear

sudo dpkg --add-architecture i386
sudo apt update
sudo apt install curl aria2 wget ca-certificates --no-install-recommends --no-install-suggests -y
/bin/bash -c "$(curl -sL https://git.io/vokNn)"
sudo apt-fast install firefox-esr smplayer cantata mpd mpv youtube-dl synaptic eject bash-completion gvfs* plasma-nm kde-spectacle xinit pulseaudio alsa-utils ark gwenview kate xserver-xorg xdg-user-dirs wpasupplicant gimp xserver-xorg-video-nouveau fonts-noto* geoclue-2.0 arc-theme kdeconnect papirus-icon-theme breeze-cursor-theme steam flatpak desktop-base kde-config-gtk-style kde-config-screenlocker khotkeys kinfocenter kmenuedit kscreen qps kio-extras kwin-x11 powerdevil systemsettings plasma-discover kde-plasma-desktop plasma-pa kwalletmanager qml-module-org-kde-newstuff qml-module-org-kde-activities kactivities-bin ffmpegthumbs lightdm lightdm-gtk-greeter-settings  --no-install-recommends --no-install-suggests -y
xdg-user-dirs-update
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak install adriconf
sudo apt-fast install -y openvpn -y --no-install-recommends --no-install-suggests
sudo cp 50-mouse-acceleration.conf /usr/share/X11/xorg.conf.d/
sudo cp 69-sysctl-performance.conf /etc/sysctl.d/
cp .mpdconf ~/

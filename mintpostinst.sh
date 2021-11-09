#! /bin/bash

clear

# in this sh file, there's just a bunch of packages that i personally use.
sudo apt update
sudo apt purge --auto-remove firefox libreoffice* thunderbird onboard catfish sticky celluoid compiz* drawing hexchat hypnotix light-locker redshift* rhythmbox transmission-* warpinator sticky catfish orca
sudo apt install cantata gimp fonts-noto* kdeconnect breeze-cursor-theme steam plank mpv mpd xscreensaver caffeine -y --no-install-recommends --no-install-suggests 
sudo cp 50-mouse-acceleration.conf /usr/share/X11/xorg.conf.d/
sudo cp 69-sysctl-performance.conf /etc/sysctl.d/
xfconf-query -c xfce4-session -np '/shutdown/ShowSwitchUser' -t 'bool' -s 'false'
rm -r -v ~/.cache/sessions/*
sudo cp kioskrc /etc/xdg/xfce4/kiosk/

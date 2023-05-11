#! /bin/bash
sudo apt install vala-panel-appmenu appmenu* xfce4-appmenu-plugin plank
xfconf-query -c xsettings -p /Gtk/ShellShowsMenubar -n -t bool -s true
xfconf-query -c xsettings -p /Gtk/ShellShowsAppmenu -n -t bool -s true
sudo cp 52appmenu-gtk-module_add-to-gtk-modules /etc/X11/Xsession.d
# shittyos-live-essentials.ks
#
# Description:
# - The ShittyOS kickstart file, adding, removing, and doing other necessary stuff.
#
# Maintainer(s):
# - katniny (https://github.com/katniny)

# boring! lemme do funny stuff and let you boot!
# oh, there's a file to do that. thanks!
# also, no, i did not struggle to set up my own config...
# im just trying to be funny. did it work? D:
%include fedora-live-base.ks

# repos so livecd-builder knows what to do
repo --name=fedora --baseurl=https://download.fedoraproject.org/pub/fedora/linux/releases/41/Everything/x86_64/os/
repo --name=updates --baseurl=https://download.fedoraproject.org/pub/fedora/linux/updates/41/Everything/x86_64/

# packages to add/remove
%packages
@core
-firefox
netsurf # usable.. barely
fastfetch
@gnome-desktop
gdm
-gnome-contacts
-evince
-gnome-weather
-gnome-clocks
-gnome-maps
-totem
-gnome-boxes
-simple-scan
-showtime
-snapshot
-decibels
-gnome-connections
-papers
-loupe
-gnome-characters
-gnome-font-viewer
-baobab
-gnome-disk-utility
-gnome-logs
-gnome-system-monitor
-gnome-tour
-yelp
-gnome-calendar
-gnome-software
-gnome-text-editor
-gnome-calculator

%end

# DVD payload
part / --size=9000

%post --interpreter=/bin/bash

# enable gdm on boot
systemctl enable gdm
systemctl set-default graphical.target

# force auto-login in GDM
mkdir -p /etc/gdm
cat > /etc/gdm/custom.conf << EOF
[daemon]
AutomaticLoginEnable=True
AutomaticLogin=liveuser

# remove title buttons... who needs 'em?
gsettings set org.gnome.desktop.wm.preferences button-layout ''

%end
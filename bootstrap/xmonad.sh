#!/bin/bash

echo "Installing x"
apt-get -y install xinit virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11

# Allow anyone to run display session
sed 's/allowed_users=.*/allowed_users=anybody/' -i /etc/X11/Xwrapper.config

VBoxClient --clipboard
VBoxClient --draganddrop
VBoxClient --display
VBoxClient --checkhostversion
VBoxClient --seamless


# Install xmonad

apt-get install -y xmonad xmobar suckless-tools feh

mkdir /home/vagrant/.xmonad
ln -s /vagrant/config/xmonad/xmonad.hs /home/vagrant/.xmonad/xmonad.hs
ln -s /vagrant/config/xmonad/.xmobarrc /home/vagrant/.xmobarrc

echo "startx &" >> /home/vagrant/.profile

cp /etc/X11/xinit/xinitrc /home/vagrant/.xinitrc

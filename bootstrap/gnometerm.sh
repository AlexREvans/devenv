#!/bin/bash

echo "Installing gnome-terminal"
ln -s  /vagrant/config/gnome/.gconf /home/vagrant/.gconf
apt-get -y install gnome-terminal


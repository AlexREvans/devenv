#!/bin/bash

echo "Europe/London" > /etc/timezone
dpkg-reconfigure --frontent noninteractive tzdata

apt-get update -y

mkdir -p /vagrant/home

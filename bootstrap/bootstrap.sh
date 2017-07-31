#!/bin/bash

echo "Europe/London" > /etc/timezone
dpkg-reconfigure --frontend noninteractive tzdata

apt-get update -y

mkdir -p /vagrant/home

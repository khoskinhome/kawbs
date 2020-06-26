#!/bin/bash

# switch off wifi :
#  sudo iwconfig wlan0 txpower off

# http://youness.net/raspberry-pi/how-to-connect-bluetooth-headset-or-speaker-to-raspberry-pi-3
sudo apt-get install pulseaudio pulseaudio-module-bluetooth -y

sudo apt-get install mosquitto mosquitto-clients -y
# TODO need to get mosquitto to start on boot.
# so some line in here to configure start on boot.
#sudo service mosquitto start

sudo apt-get install -y cpanminus -y

sudo cpanm Net::MQTT::Simple


sudo mkdir -p /opt/kawbs
sudo chown pi.pi /opt/kawbs

mkdir -p /opt/kawbs/audio
mkdir -p /opt/kawbs/lib/perl
mkdir -p /opt/kawbs/bin
mkdir -p /opt/kawbs/test




#!/bin/bash

sudo mkdir -p /opt/kawbs
sudo chown pi.pi /opt/kawbs

mkdir -p /opt/kawbs/audio/english-karl
mkdir -p /opt/kawbs/bin




# http://youness.net/raspberry-pi/how-to-connect-bluetooth-headset-or-speaker-to-raspberry-pi-3
sudo apt-get install pulseaudio pulseaudio-module-bluetooth



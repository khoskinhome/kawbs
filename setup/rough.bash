#!/bin/bash

# switch off wifi :
#  sudo iwconfig wlan0 txpower off

sudo usermod -G bluetooth -a pi
sudo apt -y purge "pulseaudio*"


# follow this :
#https://peppe8o.com/fixed-connect-bluetooth-headphones-with-your-raspberry-pi/

## sudo vim /lib/systemd/system/bluetooth.service
## Change the line :
#   ExecStart=/usr/lib/bluetooth/bluetoothd
# to :
#   ExecStart=/usr/lib/bluetooth/bluetoothd --noplugin=sap

######
## sudo vim /lib/systemd/system/bthelper@.service
##
## make the section below look like this with the "sleep 2"
# [Service]
# Type=simple
# ExecStartPre=/bin/sleep 2
# ExecStart=/usr/bin/bthelper %I

# This file :
#sudo vim /etc/bluetooth/main.conf
# should show :

# [General]:
# Enable=Source,Sink,Media,Socket

#####
# put this in ~/.asoundrc file
#defaults.bluealsa {
#    interface "hci0"
#    device 8B:13:69:8F:42:75
#    profile "a2dp"
#}
#
#pcm.btspeaker {
# type plug
#  slave {
#    pcm {
#      type bluealsa
#      interface hci0
#      device 8B:13:69:8F:42:75
#      profile "a2dp"
#    }
#  }
#  hint {
#    show on
#    description "Bluetooth Speaker"
#  }
#}
#
#pcm.!default {
#    type plug
#    slave.pcm "btspeaker"
#}
#ctl.!default {
#    type hw
#    card 0
#}


# then it's just :
#   aplay -D bluealsa 60.wav
# instead of :
# aplay -D bluealsa:DEV=00:12:6F:04:F5:B7,PROFILE=A2DP 60.wav


#########################################
# diable on board Pi Audio
####
# In /boot/config.txt
# Hash out the "dtparams=audio=o . i.e.
#---
# #Enable audio (loads snd_bcm2835)
# ###### dtparam=audio=on
#############################################

# Need to get bluealso running with
## --a2dp-keep-alive=SEC	keep A2DP transport alive
## --a2dp-keep-alive=120	keep A2DP transport alive
# to hopefully stop some of the clicks between playing
# different sound files.
# sudo vim /lib/systemd/system/bluealsa.service
# ExecStart=/usr/bin/bluealsa --a2dp-keep-alive=120
#


# don't use pulse audio.
# sudo apt -y purge "pulseaudio*"
# https://github.com/Arkq/bluez-alsa#troubleshooting
#
# https://github.com/Arkq/bluez-alsa/issues/171
#https://askubuntu.com/questions/1037370/ubuntu-18-04-bluetooth-device-disconnects-right-after-connect-on-lenovo-p50
#  sudo vim /etc/pulse/default.pa
#
#  sudo vim /etc/bluetooth/main.conf
#  sudo vim /etc/pulse/daemon.conf
#
#  sudo vim /etc/pulse/default.pa

## Not this one
##### http://youness.net/raspberry-pi/how-to-connect-bluetooth-headset-or-speaker-to-raspberry-pi-3
###  sudo apt-get install pulseaudio pulseaudio-module-bluetooth -y

sudo apt-get install bluealsa -y

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




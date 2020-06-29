#!/bin/bash

# script for debian/ubuntu/raspbian (Raspberry Pi OS)
# to install the files to /opt/kawbs
# and the package dependencies.

if [[ ! -f /etc/debian_version ]]; then
    echo "This script is only for debian/ubuntu/raspbian (Raspberry Pi OS)"
    exit 1;
fi

if [ ! -d "./audio" ] ; then
    echo "You are not in the main checkout directory ( no ./audio )"
    exit 1;
fi
if [ ! -d "./bin" ] ; then
    echo "You are not in the main checkout directory ( no ./bin )"
    exit 1;
fi
if [ ! -d "./lib/perl/KAWBS" ] ; then
    echo "You are not in the main checkout directory ( no ./lib/perl/KAWBS )"
    exit 1;
fi

if [ ! -f "README.kawbs.txt" ] ; then
    echo "You are not in the main checkout directory ( no ./README.kawbs.txt )"
    exit 1;
fi

echo "passed install tests"

sudo usermod -G bluetooth -a `whoami`

## only run the following on a Pi that will be dedicated to kawbs,
# and not a dev machine that might still want pulseaudio.
#
#### sudo apt -y purge "pulseaudio*"

sudo apt-get install bluealsa -y
sudo apt-get install mosquitto mosquitto-clients -y

sudo apt-get install -y cpanminus -y

sudo cpanm Net::MQTT::Simple
sudo cpanm JSON
sudo cpanm AnyEvent::MQTT
sudo cpanm Device::SerialPort
#sudo cpanm Device::ELM327

#sudo apt install perltidy

sudo mkdir -p /opt/kawbs
sudo chown `whoami` /opt/kawbs

mkdir -p /opt/kawbs/audio
mkdir -p /opt/kawbs/lib/perl
mkdir -p /opt/kawbs/bin
mkdir -p /opt/kawbs/test
mkdir -p /opt/kawbs/conf

./setup/install-copy-files-only.bash


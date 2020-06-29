#!/bin/bash

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

echo
echo Copying files to /opt/kawbs
echo

scp -vr ./audio/*  /opt/kawbs/audio
scp -vr ./lib/*    /opt/kawbs/lib

chmod 755 ./bin/*
scp -vr ./bin/*    /opt/kawbs/bin

chmod 755 ./test/*
scp -vr ./test/*   /opt/kawbs/test


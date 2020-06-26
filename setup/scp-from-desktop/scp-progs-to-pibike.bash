#!/bin/bash
CURRDIR=`pwd`
cd "$(dirname "$0")"
source kawbs-env.bash
cd $CURRDIR



scp -r ./lib/* $KAWBS_USER@$KAWBS_HOST:/opt/kawbs/lib

chmod 755 ./bin/*

scp -r ./bin/* $KAWBS_USER@$KAWBS_HOST:/opt/kawbs/bin

chmod 755 ./test/*
scp -r ./test/* $KAWBS_USER@$KAWBS_HOST:/opt/kawbs/test

#!/bin/bash
CURRDIR=`pwd`
cd "$(dirname "$0")"
source kawbs-env.bash
cd $CURRDIR

scp -r ./audio/*  $KAWBS_USER@$KAWBS_HOST:/opt/kawbs/audio

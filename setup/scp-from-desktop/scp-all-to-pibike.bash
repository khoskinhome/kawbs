#!/bin/bash
CURRDIR=`pwd`
cd "$(dirname "$0")"
source kawbs-env.bash

./scp-progs-to-pibike.bash
./scp-sounds-to-pibike.bash


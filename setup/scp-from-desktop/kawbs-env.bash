#!/bin/bash

if [[ ! $KAWBS_HOST ]]; then
    echo "need KAWBS_HOST env for this script"
    exit 1
fi

if [[ ! $KAWBS_USER ]]; then
    KAWBS_USER=pi
fi


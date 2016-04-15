#!/bin/bash

mkdir -p /tmp/env
f=/tmp/env/$1.env

if [[ $ACTION == "add" ]]; then
 echo $1=$DEVNAME > $f
fi

if [[ $ACTION == "remove" ]]; then

 echo "" > $f
fi

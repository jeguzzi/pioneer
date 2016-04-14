#!/usr/bin/env

export HOST_HOME=`pwd`

alias run_ros='docker run -it --rm -v $HOST_HOME/catkin_ws/src:/home/root/catkin_ws/src:ro \
--net=host --device=/dev/$(readlink /dev/myrobot):/dev/myrobot --device=/dev/$(readlink /dev/mygps*):/dev/mygps  --device=/dev/input/js0 --device=/dev/$(readlink /dev/mylaser):/dev/mylaser \
jeguzzi/pioneer:dev'

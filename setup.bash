#!/usr/bin/env

HOST_HOME=`pwd`

alias run_ros='docker run --rm -it -v $HOST_HOME/catkin_ws/src:/home/root/catkin_ws/src \
--net=host jeguzzi/pioneer:dev'

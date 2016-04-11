#!/usr/bin/env

export HOST_HOME=`pwd`

alias run_ros='docker run -it --rm -v $HOST_HOME/catkin_ws/src:/home/root/catkin_ws/src \
--net=host jeguzzi/pioneer:dev'

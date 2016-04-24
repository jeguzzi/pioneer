#!/usr/bin/env

HOST_HOME=`pwd`


V="-v /tmp/env:/env -v $HOST_HOME/catkin_ws/src/pioneer_outdoor:/home/root/catkin_ws/src/pioneer_outdoor:ro -v $HOST_HOME/settings/$HOSTNAME.env:/env/settings.env"
CONFIG="--privileged --net=host $V"


alias run_ros='docker run -it --rm -v $HOST_HOME/catkin_ws/src:/home/root/catkin_ws/src:ro \
--net=host --device=/dev/fw1 --device=/dev/fw0 --device=/dev/$(readlink /dev/myrobot):/dev/myrobot   --device=/dev/input/js0 --device=/dev/$(readlink /dev/mylaser):/dev/mylaser \
jeguzzi/pioneer:dev'

alias prun_ros='docker run -it --rm -v /tmp/env:/env -v $HOST_HOME/catkin_ws/src:/home/root/catkin_ws/src:ro \
--privileged --net=host jeguzzi/pioneer:dev'

alias pioneer_core='docker run -it --rm $CONFIG jeguzzi/pioneer:dev roslaunch pioneer_outdoor $HOSTNAME.launch'
alias pioneer_core_auto='docker run -d --restart=always $CONFIG jeguzzi/pioneer:dev roslaunch pioneer_outdoor $HOSTNAME.launch'

alias pioneer_localization='docker run -it --rm $CONFIG jeguzzi/pioneer:dev roslaunch pioneer_outdoor outdoor_localization.launch'

alias pioneer_i_localization='docker run -it --rm $CONFIG jeguzzi/pioneer:dev roslaunch pioneer_outdoor indoor_localization.launch'

alias pioneer_control='docker run -it --rm $CONFIG jeguzzi/pioneer:dev roslaunch pioneer_outdoor indoor_navigation.launch sick:=1'

alias pioneer_network='docker run -it --rm $CONFIG jeguzzi/pioneer:base roslaunch pioneer_outdoor network.launch nimbro:=1 remote_port:=10002'

alias pioneer_it='docker run -it --rm $CONFIG jeguzzi/pioneer:base'

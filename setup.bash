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



alias ros_master='docker run -d --restart=always --name roscore  $CONFIG jeguzzi/pioneer:dev roscore'

alias pioneer_core_auto='docker run -d --restart=always $CONFIG jeguzzi/pioneer:dev roslaunch pioneer_outdoor $HOSTNAME.launch'

alias pioneer_localization='docker run -it --rm $CONFIG jeguzzi/pioneer:dev roslaunch pioneer_outdoor outdoor_localization.launch'

alias pioneer_i_localization='docker run -it --rm $CONFIG jeguzzi/pioneer:dev roslaunch pioneer_outdoor indoor_localization.launch'

alias pioneer_control='docker run -it --rm $CONFIG jeguzzi/pioneer:dev roslaunch pioneer_outdoor outdoor_navigation.launch sick:=1'

alias pioneer_network='docker run -it --rm $CONFIG jeguzzi/pioneer:dev roslaunch pioneer_outdoor network.launch nimbro:=1'



alias pioneer_it='docker run -it --rm $CONFIG jeguzzi/pioneer:dev'
alias pioneer_itm='docker run -it --rm $CONFIG -v /var/run/docker.sock:/var/run/docker.sock jeguzzi/pioneer:monitor'



alias pioneer_camera='docker run -d  --name camera  $CONFIG jeguzzi/pioneer:dev roslaunch pioneer_outdoor camera-core.launch quality:=15 --wait'
alias pioneer_laser='docker run -d  --name laser  $CONFIG jeguzzi/pioneer:dev roslaunch pioneer_outdoor laser.launch sick:=1 --wait'
alias pioneer_gps='docker run -d  --name gps  $CONFIG jeguzzi/pioneer:dev roslaunch pioneer_outdoor gps-core.launch --wait'

alias pioneer_lcm='docker run -d $CONFIG --name lcm jeguzzi/pioneer:dev roslaunch pioneer_outdoor lcm.launch'

alias pioneer_core_core='docker run -d --restart=always --name core  $CONFIG jeguzzi/pioneer:dev roslaunch pioneer_outdoor core-core.launch model:=$HOSTNAME'
alias pioneer_core_robot='docker run -d --restart=always --name p3at  $CONFIG jeguzzi/pioneer:dev roslaunch pioneer_outdoor core_robot.launch p2os:=1 --wait'
alias pioneer_monitor='docker run -d --restart=always --name ui $CONFIG -v /var/run/docker.sock:/var/run/docker.sock jeguzzi/pioneer:monitor roslaunch pioneer_outdoor monitor.launch --wait'

alias pioneer_video='docker run -d --restart=always --name video_stream $CONFIG -v /var/run/docker.sock:/var/run/docker.sock jeguzzi/pioneer:monitor roslaunch pioneer_outdoor video.launch --wait'

alias pioneer_ahrs='docker run -d --restart=always --name ahrs  $CONFIG jeguzzi/pioneer:dev roslaunch pioneer_outdoor ahrs-core.launch --wait'

alias pioneer_odom='docker run -d --restart=always --name odom $CONFIG jeguzzi/pioneer:dev roslaunch pioneer_outdoor odom_localization.launch --wait'

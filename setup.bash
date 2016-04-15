#!/usr/bin/env

export HOST_HOME=`pwd`

alias run_ros='docker run -it --rm -v $HOST_HOME/catkin_ws/src:/home/root/catkin_ws/src:ro \
--net=host --device=/dev/fw1 --device=/dev/fw0 --device=/dev/$(readlink /dev/myrobot):/dev/myrobot   --device=/dev/input/js0 --device=/dev/$(readlink /dev/mylaser):/dev/mylaser \
jeguzzi/pioneer:dev'

alias prun_ros='docker run -it --rm -v /tmp/env:/env -v $HOST_HOME/catkin_ws/src:/home/root/catkin_ws/src:ro \
--privileged --net=host jeguzzi/pioneer:dev'

alias pioneer_core='docker run -it --rm -v /tmp/env:/env -v $HOST_HOME/catkin_ws/src:/home/root/catkin_ws/src:ro \
--privileged --net=host jeguzzi/pioneer:dev roslaunch p2os_launch pioneer2_master.launch'

alias pioneer_loc='docker run -it --rm -v /tmp/env:/env -v $HOST_HOME/catkin_ws/src:/home/root/catkin_ws/src:ro \
--privileged --net=host jeguzzi/pioneer:dev roslaunch pioneer_outdoor robot.launch'

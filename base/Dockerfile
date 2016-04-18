# Dev workspace

FROM ros:jade-robot

MAINTAINER Jerome Guzzi jerome@idsia.chlaunch/camera.launch

RUN apt-get update && apt-get install -y \
    build-essential \
    # python-distribute \
    # python-pip \
    ros-jade-joystick-drivers \
    ros-jade-sicktoolbox-wrapper \
    ros-jade-robot-localization \
    ros-jade-amcl \
    ros-jade-move-base \
    libgps-dev \
    git \
    # ros-jade-tf \
    # ros-jade-urdf \
    && rm -rf /var/lib/apt/lists/*

# Create virtual_env
# RUN pip install virtualenv
# virtualenv /opt/env

# RUN adduser --gecos "ROS User" --disabled-password ros
# RUN adduser ros sudo
USER root

# RUN HOME=/home/root

ENV HOME /home/root

RUN /bin/bash -c '. /opt/ros/jade/setup.bash; rosdep init; rosdep update'

# RUN /bin/bash -c '. /opt/ros/jade/setup.bash; cd /home/ros/workspace; catkin_make'

RUN apt-get update && apt-get install -y \
    libdc1394-22-dev \
    libdc1394-22 \
    libaria2 \
    libaria-dev \
    ros-jade-camera-info-manager \
    ros-jade-image-proc \
    ros-jade-driver-base  \
    ros-jade-camera-info-manager \
    ros-jade-image-transport-plugins \
    ros-jade-hokuyo-node \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /home/root/catkin_ws/src
RUN /bin/bash -c '. /opt/ros/jade/setup.bash; catkin_init_workspace /home/root/catkin_ws/src'

RUN git clone https://github.com/jeguzzi/p2os ~/catkin_ws/src/p2os
RUN git clone https://github.com/jeguzzi/gps_umd.git ~/catkin_ws/src/gps_umd
RUN git clone https://github.com/ros-drivers/camera1394.git ~/catkin_ws/src/camera1394.git
RUN git clone https://github.com/jeguzzi/pioneer_outdoor.git ~/catkin_ws/src/pioneer_outdoor
RUN git clone https://github.com/jeguzzi/rosaria.git ~/catkin_ws/src/rosaria

RUN /bin/bash -c '. /opt/ros/jade/setup.bash; catkin_make -C ~/catkin_ws'

RUN /bin/sed -i \
    '/source "\/opt\/ros\/$ROS_DISTRO\/setup.bash"/a source "\/home\/root\/catkin_ws\/devel\/setup.bash"\nset -a\nfor f in /env/*.env; do source $f; done\nset +a'  \
    /ros_entrypoint.sh

ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]


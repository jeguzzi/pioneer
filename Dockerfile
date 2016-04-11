# Dev workspace

FROM ros:jade-robot

MAINTAINER Jerome Guzzi jerome@idsia.ch

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
    # ros-jade-tf \
    # ros-jade-urdf \
    && rm -rf /var/lib/apt/lists/*

# Create virtual_env
# RUN pip install virtualenv
# virtualenv /opt/env

# RUN adduser --gecos "ROS User" --disabled-password ros
# RUN adduser ros sudo
USER root

RUN HOME=/home/root

ENV HOME /home/root

RUN /bin/bash -c '. /opt/ros/jade/setup.bash; rosdep init; rosdep update'

RUN mkdir -p /home/root/catkin_ws/src
RUN /bin/bash -c '. /opt/ros/jade/setup.bash; catkin_init_workspace /home/root/catkin_ws/src'
# RUN /bin/bash -c '. /opt/ros/jade/setup.bash; cd /home/ros/workspace; catkin_make'

RUN echo "pushd ~/catkin_ws && catkin_make && source devel/setup.bash && popd" >> /ros_entrypoint.sh

VOLUME /home/root/catkin_ws/src

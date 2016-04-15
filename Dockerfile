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

RUN HOME=/home/root

ENV HOME /home/root

RUN /bin/bash -c '. /opt/ros/jade/setup.bash; rosdep init; rosdep update'

RUN mkdir -p /home/root/catkin_ws/src
RUN /bin/bash -c '. /opt/ros/jade/setup.bash; catkin_init_workspace /home/root/catkin_ws/src'

# RUN /bin/bash -c '. /opt/ros/jade/setup.bash; cd /home/ros/workspace; catkin_make'

RUN git clone https://github.com/jeguzzi/p2os ~/catkin_ws/src/p2os
RUN git clone https://github.com/jeguzzi/pioneer_outdoor.git ~/catkin_ws/src/pioneer_outdoor
RUN git clone https://github.com/jeguzzi/gps_umd.git ~/catkin_ws/src/gps_umd
RUN git clone https://github.com/ros-drivers/camera1394.git ~/catkin_ws/src/camera1394.git


RUN apt-get update && apt-get install -y \
    ros-jade-camera-info-manager \
    ros-jade-image-proc \
    libdc1394-22-dev \ 
    libdc1394-22 \
    ros-jade-driver-base  \
    ros-jade-camera-info-manager \
    ros-jade-image-transport-plugins \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/jeguzzi/myahrs_driver ~/catkin_ws/src/myahrs_driver

# RUN echo "pushd ~/catkin_ws && catkin_make && source devel/setup.bash && popd" >> /ros_entrypoint.sh

RUN /bin/bash -c '. /opt/ros/jade/setup.bash; catkin_make -C ~/catkin_ws'


#RUN /bin/sed -i \
#    '/source "\/opt\/ros\/$ROS_DISTRO\/setup.bash"/a catkin_make -C ~/catkin_ws\nsource "\/home\/root\/catkin_ws\/devel\/setup.bash"'  \
#    /ros_entrypoint.sh

RUN /bin/sed -i \
    '/source "\/opt\/ros\/$ROS_DISTRO\/setup.bash"/a source "\/home\/root\/catkin_ws\/devel\/setup.bash"\nset -a\nfor f in /env/*.env; do source $f; done\nset +a'  \
    /ros_entrypoint.sh

RUN apt-get update && apt-get install -y \
    ros-jade-hokuyo-node \
    && rm -rf /var/lib/apt/lists/*




# RUN echo "catkin_make -C ~/catkin_ws" >> /ros_entrypoint.sh
# RUN echo "source /home/root/catkin_ws/devel/setup.bash" >> /ros_entrypoint.sh

# COPY rules/* /etc/udev/rules.d/

# VOLUME /home/root/catkin_ws/src

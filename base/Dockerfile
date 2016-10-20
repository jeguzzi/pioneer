
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
    ros-jade-navigation \
    ros-jade-hokuyo-node \	
    libdc1394-22-dev \
    libdc1394-22 \
    libaria2 \
    libaria-dev \
    ros-jade-camera-info-manager \
    ros-jade-image-proc \
    ros-jade-driver-base  \
    ros-jade-camera-info-manager \
    ros-jade-image-transport-plugins \
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

# RUN apt-get update && apt-get install -y \
#     && rm -rf /var/lib/apt/lists/*


RUN apt-get update && apt-get install -y \
    python-pyproj \
    ros-jade-multimaster-fkie \
    ros-jade-rqt-gui-cpp \
    libx264-dev \ 
    libx264-142 \   
    && rm -rf /var/lib/apt/lists/*


RUN apt-get update && apt-get install -y \
    lm-sensors \
    ros-jade-rosbridge-server \
    ros-jade-roswww \
    python-psutil \
    python-netifaces \
    python-pip \
    ros-jade-web-video-server \
&& rm -rf /var/lib/apt/lists/*

RUN pip install docker-py

RUN apt-get update && apt-get install -y \
    build-essential \
    autoconf \
    automake \
    autopoint \
    libglib2.0-dev \
    libtool \
    python-dev \
    python-catkin-tools \
    && rm -rf /var/lib/apt/lists/*


RUN mkdir -p /tmp
RUN git clone https://github.com/lcm-proj/lcm /tmp/lcm
RUN /bin/bash -c 'pushd /tmp/lcm; ./bootstrap.sh; ./configure --prefix=/usr; make; make install; popd; rm -r /tmp/lcm'

RUN mkdir -p /home/root/catkin_ws/src

RUN git clone -b jade https://github.com/ccny-ros-pkg/imu_tools.git ~/catkin_ws/src/imu_tools
RUN touch ~/catkin_ws/src/imu_tools/rviz_imu_plugin/CATKIN_IGNORE
RUN git clone https://github.com/jeguzzi/p2os ~/catkin_ws/src/p2os
RUN git clone https://github.com/jeguzzi/gps_umd.git ~/catkin_ws/src/gps_umd
RUN git clone https://github.com/ros-drivers/camera1394.git ~/catkin_ws/src/camera1394.git
RUN git clone https://github.com/jeguzzi/pioneer_outdoor.git ~/catkin_ws/src/pioneer_outdoor
RUN git clone https://github.com/jeguzzi/rosaria.git ~/catkin_ws/src/rosaria
RUN git clone https://github.com/jeguzzi/myahrs_driver.git ~/catkin_ws/src/myahrs_driver
RUN git clone https://github.com/jeguzzi/nimbro_network.git ~/catkin_ws/src/nimbro_network

RUN /bin/bash -c '. /opt/ros/jade/setup.bash; catkin_init_workspace /home/root/catkin_ws/src; catkin_make -C /home/root/catkin_ws;'



#RUN /bin/bash -c 'pushd ~/catkin_ws; catkin init; catkin config --extend /opt/ros/jade --blacklist rviz_imu_plugin; catkin build; popd;'


RUN mkdir -p /env
RUN touch /env/t.env

RUN /bin/sed -i \
    '/source "\/opt\/ros\/$ROS_DISTRO\/setup.bash"/a source "\/home\/root\/catkin_ws\/devel\/setup.bash"\nset -a\nfor f in /env/*.env; do source $f; done\nset +a'  \
    /ros_entrypoint.sh



ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]

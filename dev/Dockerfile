# Dev workspace

FROM jeguzzi/pioneer:base

MAINTAINER Jerome Guzzi jerome@idsia.ch

USER root

RUN /bin/bash -c 'pushd /home/root/catkin_ws/src/pioneer_outdoor; git pull; popd'
# RUN /bin/bash -c 'pushd /home/root/catkin_ws/src/rosaria; git pull; popd'
RUN /bin/bash -c '. /opt/ros/jade/setup.bash; catkin_make -C /home/root/catkin_ws'
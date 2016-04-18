# Dev workspace

FROM jeguzzi/pioneer:base

MAINTAINER Jerome Guzzi jerome@idsia.ch

RUN git clone https://github.com/jeguzzi/pioneer_outdoor.git ~/catkin_ws/src/pioneer_outdoor
RUN /bin/bash -c '. /opt/ros/jade/setup.bash; catkin_make -C ~/catkin_ws'
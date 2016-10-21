# Dev workspace

FROM jeguzzi/pioneer:base

MAINTAINER Jerome Guzzi jerome@idsia.ch

USER root

RUN /bin/bash -c 'pushd /home/root/catkin_ws/src/pioneer_outdoor; git pull; popd'
# RUN /bin/bash -c 'pushd /home/root/catkin_ws/src/rosaria; git pull; popd'
RUN /bin/bash -c '. /opt/ros/jade/setup.bash; catkin_make -C /home/root/catkin_ws'
#RUN /bin/bash -c 'catkin build --workspace /home/root/catkin_ws'

RUN pip uninstall docker-py -y
RUN pip install setuptools --upgrade


RUN /bin/bash -c 'pushd /tmp; git clone https://github.com/docker/docker-py.git; pushd docker-py; python setup.py install; popd; popd;'
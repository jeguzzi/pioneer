
# Monitoring

FROM jeguzzi/pioneer:base

MAINTAINER Jerome Guzzi jerome@idsia.ch

RUN apt-get update && apt-get install -y \
    lm-sensors \
    ros-jade-rosbridge-server \
    ros-jade-roswww \
    python-psutil \
    python-netifaces \
    python-pip \
    && rm -rf /var/lib/apt/lists/*

RUN pip install docker-py

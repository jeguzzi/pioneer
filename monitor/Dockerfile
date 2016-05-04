
# Dev workspace

FROM jeguzzi/pioneer:base

MAINTAINER Jerome Guzzi jerome@idsia.ch

RUN apt-get update && apt-get install -y \
    lm-sensors \
    ros-jade-rosbridge-server \
    ros-jade-roswww \
    && rm -rf /var/lib/apt/lists/*


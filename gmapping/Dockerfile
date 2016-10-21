# Dev workspace

FROM jeguzzi/pioneer:dev

MAINTAINER Jerome Guzzi jerome@idsia.ch

USER root

RUN apt-get update && apt-get install -y \
    ros-jade-gmapping \
    && rm -rf /var/lib/apt/lists/*

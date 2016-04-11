#!/usr/bin/env

mkdir -p catkin_ws/src
pushd catkin_ws/src
git clone https://github.com/jeguzzi/p2os
git clone https://github.com/jeguzzi/pioneer_outdoor.git
git clone https://github.com/jeguzzi/gps_umd.git
popd

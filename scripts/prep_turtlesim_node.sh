#!/usr/bin/env sh

set -e

ros_version=${1:-kinetic}

# Read the variable, or it does not get set apparently...
echo Setting up for ${ros_version}

mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/

sh /ros_entrypoint.sh catkin_make

#!/usr/bin/env bash

set -e

ros_version=${1:-kinetic}

# Read the variable, or it does not get set apparently...
echo Setting up for ${ros_version}

mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/
source /opt/ros/${ros_version}/setup.bash
catkin_make

#!/usr/bin/env bash

set -e

ros_version=${1:-kinetic}

# Read the variable, or it does not get set apparently...
echo Running controller on ${ros_version}

cd ~/catkin_ws/
source /opt/ros/${ros_version}/setup.bash

rosrun turtlesim turtle_teleop_key

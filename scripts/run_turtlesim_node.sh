#!/usr/bin/env bash

set -e

source ~/catkin_ws/devel/setup.bash
echo $ROS_PACKAGE_PATH

rosrun turtlesim turtlesim_node

#!/usr/bin/env bash

set -e

source ~/catkin_ws/devel/setup.bash

rosrun turtlesim turtlesim_node > /logs/turtlesim_node.out 2> /logs/turtlesim_node.err

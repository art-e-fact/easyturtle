#!/usr/bin/env sh

set -e

sh /ros_entrypoint.sh rosrun turtlesim turtlesim_node > /logs/turtlesim_node.out 2> /logs/turtlesim_node.err

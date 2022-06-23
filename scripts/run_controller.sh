#!/usr/bin/env sh

set -e

ros_version=${1:-kinetic}

# Read the variable, or it does not get set apparently...
echo Running controller on ${ros_version}

sh /ros_entrypoint.sh rosrun turtlesim turtle_teleop_key

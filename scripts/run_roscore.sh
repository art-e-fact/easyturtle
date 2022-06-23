#!/usr/bin/env bash

set -e

ros_version=${1:-kinetic}

# Read the variable, or it does not get set apparently...
echo Running roscore from ${ros_version}

source /opt/ros/${ros_version}/setup.sh

roscore > /logs/roscore.out 2> /logs/roscore.err

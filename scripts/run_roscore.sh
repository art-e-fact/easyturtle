#!/usr/bin/env sh

set -e

ros_version=${1:-kinetic}

# Read the variable, or it does not get set apparently...
echo Running roscore from ${ros_version}

sh /ros_entrypoint.sh roscore > /logs/roscore.out 2> /logs/roscore.err

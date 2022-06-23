#!/usr/bin/env sh

set -e

ros_version=${1:-kinetic}

# Read the variable, or it does not get set apparently...
echo Setting up for ${ros_version}

apk update
apk upgrade
apk add --no-cache ros-${ros_version}-ros-tutorials screen build-base

mkdir -p /logs

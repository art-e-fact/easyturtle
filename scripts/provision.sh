#!/usr/bin/env bash

set -e

ros_version=${1:-kinetic}

# Read the variable, or it does not get set apparently...
echo Setting up for ${ros_version}

sudo apt-get update
sudo apt-get dist-upgrade --yes
sudo apt-get install --yes ros-${ros_version}-ros-tutorials screen

mkdir -p /logs

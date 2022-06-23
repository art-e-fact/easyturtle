#!/usr/bin/env bash

screen -d -m -S roscore bash -x /app/run_roscore.sh

# As not using roslaunch yet, wait a sec for roscore
sleep 1

screen -d -m -S turtlesim_node bash /app/run_turtlesim_node.sh

bash run_controller.sh

#!/usr/bin/env sh

screen -d -m -S roscore sh -x /app/run_roscore.sh

# As not using roslaunch yet, wait a sec for roscore
sleep 1

screen -d -m -S turtlesim_node sh /app/run_turtlesim_node.sh

sh run_controller.sh

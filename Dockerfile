FROM alpineros/alpine-ros:kinetic-ros-core AS builder

WORKDIR /app

COPY scripts/provision.sh .
RUN sh -x -e provision.sh

COPY scripts/prep_turtlesim_node.sh .
RUN sh -x -e prep_turtlesim_node.sh

COPY scripts/run.sh .
COPY scripts/run_controller.sh .
COPY scripts/run_roscore.sh .
COPY scripts/run_turtlesim_node.sh .

ARG DISPLAY=host.docker.internal:0
ARG ROS_MASTER_URI=http://localhost:11311/
ARG ROS_HOSTNAME=localhost

ENV DISPLAY=$DISPLAY
ENV ROS_MASTER_URI=$ROS_MASTER_URI
ENV ROS_HOSTNAME=$ROS_HOSTNAME

CMD ["sh", "/app/run.sh"]

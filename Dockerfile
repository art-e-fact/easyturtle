FROM osrf/ros:kinetic-desktop

WORKDIR /app

COPY scripts/provision.sh .
RUN bash -x -e provision.sh

COPY scripts/prep_turtlesim_node.sh .
RUN bash -x -e prep_turtlesim_node.sh

COPY scripts/run.sh .
COPY scripts/run_controller.sh .
COPY scripts/run_roscore.sh .
COPY scripts/run_turtlesim_node.sh .

ENV DISPLAY=host.docker.internal:0
CMD ["bash", "/app/run.sh"]

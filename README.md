Easy Turtle
===========

Exploring how to get started with ROS TurtleSim as fast as possible using a single Docker container.


Usage
-----

### Requirements

* Some Docker Enginer. Tested with 20.10.16

### Build

A single command is needed to build a working environment. From this repository root, where `Dockerfile` is:

    docker build . -t easyturtle

The command ends with a local image tagged `easyturtle`.

### Run

Running the image executes in a single container:

    docker run --rm -it -name easyturtle easyturtle

Notes:
* `--rm` is just to delete the container after use (too simple an application and no state anyway).
* `-it` is just to be able to signal the container, without using `docker stop`.
* The minimal run command is `docker run easyturtle`.

### Interact

Controlling the turtle can be activated as follows:

    docker exec -it easyturtle bash /app/controller.sh

Keeping focus on the shell window running the controller, you can use the arrows to move the turtle around.


Motivation
----------

TurtleSim is a simple application, yet relying on the ROS infrastructure, with the core and topic. Just running this simple application requires a few steps:

0. Install the ROS tutorials for the target version (here defaults to Kinetic).
1. Run `roscore` in some background.
2. Run a TurtleSim node in some other background
3. Optionally run a controller to listen to the keyboard and publish to the turtle node.

Tutorials usually lead to 3 shells open, assuming ROS runs well on the host OS.

Trying to keep simple things simple, containers can be pretty attractive. They may not be appropriate for production environments in this way, yet offer to pack and use conveniently (well, assuming a Docker engine is available), and should bridge learning deeper ROS concepts.


Resources
---------

The first trials for this repository are based on nice resources:

* [Xiaoke Yang's Using ROS with Docker in macOS](https://www.xiaokeyang.com/blog/using_ros_with_docker_in_macos)
* [ROS TurtleSim Beginner’s Guide (Mac) by desertbot.io](https://desertbot.io/blog/ros-turtlesim-beginners-guide-mac)

The first `Dockerfile` is basically a turnkey version of their work.


Possible Next Steps
-------------------

* Replace the lazy reliance on `screen` for `systemd` or else.
* Use multi-stage Docker build to create smaller images. Currently more than 2Gb...
* Integrate the turtle controller as yet another process, to really have a single container.
* Expose the ROS version parameter. Defaults to `kinetic`, but not exposed at this point.

Easy Turtle
===========

Exploring how to get started with ROS TurtleSim as fast as possible using a single Docker container.


Usage
-----

### Requirements

* A system with X11 available
  * Most desktop Linux distributions.
  * [MacOS] [XQuartz](https://github.com/XQuartz/XQuartz) to get X11.
* Some Docker Engine
  * Tested with 20.10.16, 20.10.17 and 19.03.5
  * Tested on Ubuntu 18, 20, 22 and MacOS.

### Build

A single command is needed to build a working environment. From this repository root, where `Dockerfile` is:

    docker build . -t easyturtle

The command ends with a local image tagged `easyturtle`.

### Run

Running the image executes is *often* just:

    docker run --rm --interactive --tty --name easyturtle easyturtle

Tests on Ubuntu 18 through 22 have required:

    docker run --rm --interactive --tty --env DISPLAY=$DISPLAY --net host --name easyturtle easyturtle

Tests on MacOS and Ubuntu 20 often require explictly authorising access to X11:
* [MacOS] `xhost + 127.0.0.1`: This will start an X11 server if needed, and allow the container to connect.
* [Ubuntu 20] `xhost + local:`, for testing, `xhost +` is also available but not recommended (security issue, important to reactivate after usage with `xhost -`).

Notes:
* `--rm` is just to delete the container after use (too simple an application and no state anyway).
* `--interactive --tty` is to be able to allow controling the turtle with the keyboard.
* `--net host` sets the container on the same network as the host machine, so the container can access the X11 server.
* The minimal (yet uninteresting beyond testing) run command is `docker run easyturtle`.

### Interact

Keeping focus on the shell window running the container, you can use the arrows to move the turtle around.


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
* ~~Integrate the turtle controller as yet another process, to really have a single container.~~
* Expose the ROS version parameter. Defaults to `kinetic`, but not exposed at this point.

FROM ubuntu:20.04
WORKDIR /tmp/sfm

# Set up ROS2
RUN apt update && apt install -y wget python3 python3-pip
RUN apt install -y gnupg2 lsb-release expect curl
RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -
RUN sh -c 'echo "deb [arch=$(dpkg --print-architecture)] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" > /etc/apt/sources.list.d/ros2-latest.list'
RUN apt update
RUN apt install ros-foxy-desktop

# Initialize the ROS2 build environment
RUN apt install python3-rosdep2
RUN rosdep init
RUN rosdep update
RUN apt install python3-colcon-common-extensions python3-argcomplete

# Install CV and NN libraries
RUN pip install keras tensorflow==1.15 
RUN pip install opencv-python opencv-contrib-python

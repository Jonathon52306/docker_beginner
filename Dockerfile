#ROS
FROM ros:kinetic-ros-core-xenial
RUN apt-get update && apt-get install --no-install-recommends -y \
    build-essential \
    python-rosdep \
    python-rosinstall \
    python-vcstools \
    && rm -rf /var/lib/apt/lists/*
RUN rosdep init \
  && rosdep update --rosdistro $ROS_DISTRO \
  && echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc
RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-kinetic-ros-base=1.3.2-0* \
    && rm -rf /var/lib/apt/lists/*
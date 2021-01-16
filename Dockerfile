#ROS
FROM ros:kinetic-ros-core-xenial
RUN apt-get update && apt-get install --no-install-recommends -y \
    build-essential \
    python-rosdep \
    python-rosinstall \
    python-vcstools \
    git \
    && rm -rf /var/lib/apt/lists/*
RUN rosdep init \
  && rosdep update --rosdistro $ROS_DISTRO \
  && echo "source /opt/ros/indigo/setup.bash" >> /root/.bashrc
RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-kinetic-ros-base=1.3.2-0* \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /root/
RUN mkdir /root/tutorial_ws \
    && git clone https://github.com/DroidAITech/ROS-Academy-for-Beginners.git \
    && cd /root/tutorial_ws/ \
    && rosdep install --from-paths src --ignore-src --rosdistro=kinetic -y \
    && catkin_make \
    && echo 'source /root/tutorial_ws/devel/setup.bash' >> /root/.bashrc
#ROS
FROM ros:kinetic-ros-core-xenial
SHELL [ "/bin/bash","-c" ]
RUN apt-get update && apt-get install --no-install-recommends -y \
    build-essential \
    python-rosdep \
    python-rosinstall \
    python-vcstools \
    git \
    && apt upgrade -y \
    && rm -rf /var/lib/apt/lists/*
RUN rosdep init \
  && rosdep update --rosdistro $ROS_DISTRO \
  && echo "source /opt/ros/indigo/setup.bash" >> /root/.bashrc
RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-kinetic-ros-base=1.3.2-0* \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /root/
RUN mkdir /root/tutorial_ws \
    && git clone https://github.com/DroidAITech/ROS-Academy-for-Beginners.git /root/tutorial_ws/src \
    && cd /root/tutorial_ws/ \
    && apt update \
    && rosdep install --from-paths src --ignore-src --rosdistro=kinetic -y \
    && bash \
    && source /opt/ros/indigo/setup.bash \
    && catkin_make \
    && echo 'source /root/tutorial_ws/devel/setup.bash' >> /root/.bashrc
# FROM ros:noetic as base
FROM ros:noetic-ros-core-focal

# ros required dependencies
RUN apt-get update && apt-get install --no-install-recommends -y \
    build-essential \
    python3-rosdep \
    python3-rosinstall \
    python3-vcstools \
    && rm -rf /var/lib/apt/lists/*

# minimal required dependencies
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y \
    curl ca-certificates gnupg udev lsb-release wget udev \
    sockstat pip git nano vim net-tools iputils-ping iproute2 htop \
    libeigen3-dev netcat iperf3 libusb-1.0-0-dev \
    linux-tools-common linux-tools-generic linux-tools-$(uname -r)

RUN pip3 install cvxpy

# catkin build
RUN mkdir -p /root/catkin_ws/src && cd /root/catkin_ws/

# Initialize rosdep
RUN rosdep init && \
    rosdep update --rosdistro $ROS_DISTRO

# Install ROS base packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-noetic-tf2 \
    ros-noetic-tf \
    ros-noetic-tf-conversions \
    ros-noetic-ros-base=1.5.0-1* \
    ros-noetic-mavros-msgs \
    && rm -rf /var/lib/apt/lists/*

# Create an entrypoint script to pull the latest updates and build the workspace
COPY entrypoint.sh /root/entrypoint.sh
RUN chmod +x /root/entrypoint.sh

# Source ROS and workspace setup files
RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
RUN echo "source /root/catkin_ws/devel/setup.bash" >> ~/.bashrc

# Set the entrypoint
ENTRYPOINT ["/root/entrypoint.sh"]

# Default command
CMD ["4", "$(hostname -I | awk '{print $1}')", "$(hostname -I | awk '{print $1}')"]

#!/bin/bash

# Default values
DEFAULT_PREFIX="robots"
DEFAULT_NUM_ROBOTS=4

# Parse arguments with default values
PREFIX=${1:-$DEFAULT_PREFIX}
NUM_ROBOTS=${2:-$DEFAULT_NUM_ROBOTS}

# Generate timestamp for rosbag file
TIMESTAMP=$(date +"%d%m%y_%H%M")
BAG_NAME="bag_${TIMESTAMP}.bag"

# Define base topics
TOPICS=("docker_stats")

# Loop through the number of robots and dynamically generate topics
for ((i=1; i<=NUM_ROBOTS; i++)); do
    TOPICS+=(
        "demo_turtle${i}/odom"
        "demo_turtle${i}/ref"
        "demo_turtle${i}/cons"
        "demo_turtle${i}/cmd_vel"
        "demo_turtle${i}/params"
        "demo_turtle${i}/update_ugv_mode"
        "dcf${i}/odometry_sensor${i}/odometry"
        "dcf${i}/ref"
        "dcf${i}/cons"
        "dcf${i}/vel_msg"
        "dcf${i}/params"
        "dcf${i}/update_uav_mode"
        "dcf${i}/land_signal"
    )
  done

# Start recording with rosbag
rosbag record -O "$BAG_NAME" ${TOPICS[@]}

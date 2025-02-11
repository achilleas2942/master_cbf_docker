# Master for CBF constraints

## Docker image to lauch a master to update the CBF constraints between multiple ground robots (turtlebots) and aerial robots (pelicans)

### 1. Preparation Checklist
- Install Docker Engine
    - Install docker on Ubuntu: [docker installation guide for Ubuntu](https://docs.docker.com/engine/install/ubuntu/)
    - Check docker is properly setup on laptop: open a terminal and run
      ```
      docker run hello-world
      ```

### 2. Clone the repository
  ```
  git clone https://github.com/achilleas2942/master_cbf_docker.git
  ```

### 3. Run the master
#### Option 1 - Build docker image locally and run docker container using the create and run bash script files
  - Go to the docker directory
    ```
    cd master_cbf_docker/docker/
    ```
  - Run the bash script file to create the docker image
    ```
    ./create_image.sh
    ```
  - Run the bash script file to launch the master with or without the parameters robots, ros_master_uri, and ros_ip
    ```
    ./run_container.sh robots <specify_the_number_of_robot_pairs> ros_master_uri <specify_the_ros_master_uri_ip> ros_ip <specify_the_ros_ip>
    ```
    e.g.
      - ```
        ./run_container.sh robots 2 ros_master_uri 127.0.0.1 ros_ip 127.0.0.1
        ```
      - or
        ```
        ./run_container.sh
        ```

#### Option 2 - Pull docker image locally and run docker container using docker pull and the run bash script file
  - Pull the docker image from the [master](https://github.com/achilleas2942/master_cbf_docker/pkgs/container/master-cbf) GitHub package
    ```
    docker pull ghcr.io/achilleas2942/master-cbf:latest
    ```
  - Go to the docker directory
    ```
    cd master_cbf_docker/docker/
    ```
  - Run the bash script file to launch the master with or without the parameters robots, ros_master_uri, and ros_ip
    ```
    ./run_container.sh robots <specify_the_number_of_robot_pairs> ros_master_uri <specify_the_ros_master_uri_ip> ros_ip <specify_the_ros_ip>
    ```
    e.g.
      - ```
        ./run_container.sh robots 2 ros_master_uri 127.0.0.1 ros_ip 127.0.0.1
        ```
      - or
        ```
        ./run_container.sh
        ```

#### Option 3 - Run directly docker container using the run bash script file
  - Go to the docker directory
    ```
    cd master_cbf_docker/docker/
    ```
  - Run the bash script file to launch the master with or without the parameters robots, ros_master_uri, and ros_ip
    ```
    ./run_container.sh robots <specify_the_number_of_robot_pairs> ros_master_uri <specify_the_ros_master_uri_ip> ros_ip <specify_the_ros_ip>
    ```
    e.g.
      - ```
        ./run_container.sh robots 2 ros_master_uri 127.0.0.1 ros_ip 127.0.0.1
        ```
      - or
        ```
        ./run_container.sh
        ```

*If you do not specify the parameters robots, ros_master_uri, and ros_ip, then the following default values will be selcted:*
- *robots 4*
- *ros_master_uri $(hostname -I | awk '{print $1}')*
- *ros_ip $(hostname -I | awk '{print $1}')*

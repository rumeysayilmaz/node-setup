# Node-Setup

docker-compose.yml is a configuration file used to create a runnable instance of an image which is comfigured inside a Dockerfile.

In this project, we configure different images for each blockchain node and create containers specific to the respective chain.

Each container is isolated from other containers and runs its own software, binaries, and configurations.

This project can be run on a local machine or deployed to a cloud server.

## Library dependencies

**OS Version:** Ubuntu 20.04

Make updates to the OS:

`sudo apt-get update && sudo apt-get upgrade -y`

Install docker compose with the following command:

`sudo apt-get install docker-compose`

Verify the installed version:

`docker-compose --version`

Clone the repository:

`git clone https://github.com/rumeysayilmaz/node-setup.git`

`cd node-setup`

Before building the docker service, change the corresponding values of `PW` and `ports` for security reasons and save the file.

`sudo nano docker-compose.yml`

To build the services, run the following command:

`docker-compose build`


To run containers in the background in detached mode:

`docker-compose up -d`

If you wish to make a direct connection to the container, then place the ip address of your remote host on the `youripaddress` below:

From shell, to make an ssh connection with the respective port number (the port number in the `docker-compose.yml` file):

`ssh root@youripaddress -p 49155`

To start the daemon:

`./run_mcl`
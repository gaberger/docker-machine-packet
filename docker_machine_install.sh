#!/bin/bash
if [[ $EUID -ne 0 ]]; then
	 echo "This script must be run as root" 
   exit 1
fi

export DEBIAN_FRONTEND=noninteractive
DOCKER_MACHINE_VERSION=v0.16.0
DOCKER_MACHINE_BASE=https://github.com/docker/machine/releases/download
DOCKER_DRIVER_PACKET_VERSION=v0.1.4
DOCKER_MACHINE_PACKET_BASE=https://github.com/packethost/docker-machine-driver-packet/releases/download

# Update packages

apt-get -qq install unzip 
# Get docker-machine

if [ ! -f /usr/local/bin/docker-machine ]; then
	curl -L $DOCKER_MACHINE_BASE/$DOCKER_MACHINE_VERSION/docker-machine-$(uname -s)-$(uname -m) --output /usr/local/bin/docker-machine &&
	chmod +x /usr/local/bin/docker-machine
else
	echo "docker-machine already installed"
fi

# Get Packet docker-machine driver
if [ ! -f /usr/local/bin/docker-machine-driver-packet ]; then
	TMPFILE=$(mktemp  -d) && {
       curl -L $DOCKER_MACHINE_PACKET_BASE/$DOCKER_DRIVER_PACKET_VERSION/docker-machine-driver-packet_linux-amd64.zip --output docker-machine-driver-packet_linux-amd64.zip &&
       unzip docker-machine-driver-packet_linux-amd64.zip &&
       mv docker-machine-driver-packet /usr/local/bin/docker-machine-driver-packet
       rm -rf $TMPFILE
	}
else
		echo "docker-machine packet driver already installed"
fi


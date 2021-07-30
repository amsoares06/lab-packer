#!/bin/bash

# Get OS type and update it
if cat /etc/os-release | grep -w ID | grep centos; then
    OS="centos"
    echo "[INFO] CentOS detected..."
    # Update all
    yum update -y -q
    # Install software
    yum install -y -q \
        net-tools \
        wget

elif cat /etc/os-release | grep -w ID | grep ubuntu; then
    OS="ubuntu"
    echo "[INFO] Ubuntu detected..."
    # Update all
    apt-get -q update
    apt-get -q upgrade -y
    # Install software
    apt-get install net-tools

else
    echo "[ERROR] OS not supported..."
    exit 1
fi

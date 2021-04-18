#!/bin/bash

# Get OS type and update it
if cat /etc/os-release | grep -w ID | grep centos; then
    OS="centos"
    echo "[INFO] CentOS detected..."
    # Update all
    yum update -y
    # Install software
    yum install -y \
        net-tools \
        wget

elif cat /etc/os-release | grep -w ID | grep ubuntu; then
    OS="ubuntu"
    echo "[INFO] Ubuntu detected..."
    # Update all
    apt update
    apt upgrade -y
    # Install software
    apt install net-tools

else
    echo "[ERROR] OS not supported..."
    exit 1
fi

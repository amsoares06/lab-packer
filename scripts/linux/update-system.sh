#!/bin/bash

# Get OS type
OS=$(cat /etc/os-release | grep -w ID | cut -d'=' -f2 | tr -d '"')
echo "[INFO] ${OS} detected..."

# CentOS / AlmaLinux
if [ ${OS} = "centos" ] || [ ${OS} = "almalinux" ]; then
    # Update all
    yum update -y -q
    # Install software
    yum install -y -q \
        net-tools \
        wget

# Ubuntu
elif [ ${OS} = "ubuntu" ]; then
    # Update all
    apt-get -q update
    apt-get -q upgrade -y
    # Install software
    apt-get install net-tools

else
    echo "[ERROR] OS not supported..."
    exit 1
fi

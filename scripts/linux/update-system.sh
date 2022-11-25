#!/bin/bash

# Get OS type
OS=$(cat /etc/os-release | grep -w ID | cut -d'=' -f2 | tr -d '"')
echo "[INFO] ${OS} detected..."

case ${OS} in
  "centos")
    # Update all
    yum update -y -q
    # Install software
    yum install -y -q \
      net-tools \
      wget
    ;;

  "almalinux")
    # Update all
    dnf update -y -q
    # Install software
    dnf install -y -q \
      net-tools \
      wget
    ;;

  "ubuntu")
    # Update all
    apt-get -q update
    apt-get -q upgrade -y
    # Install software
    apt-get install net-tools
    ;;

  *)
    echo "[ERROR] OS not supported..."
    exit 1
    ;;
esac

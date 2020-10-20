#!/bin/bash

yum install http://yum.puppetlabs.com/puppet-release-el-7.noarch.rpm -y

yum install puppet-agent -y

## TO DO:
# add puppetmaster to /etc/hosts
echo "192.168.15.21 puppet" >> /etc/hosts

# add puppetmaster to /etc/puppetlabs/puppet/puppet.conf
echo "server = puppet"  >> /etc/puppetlabs/puppet/puppet.conf

#!/bin/bash

# Disable NM
systemctl disable NetworkManager
systemctl stop NetworkManager
systemctl restart network
systemctl enable network

# Install puppet PC1 on the VM
yum -y install epel-release

yum -y install https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
yum -y install puppet-agent
yum -y erase NetworkManager

/opt/puppetlabs/bin/puppet apply -t --modulepath=/vagrant/modules /vagrant/manifests/site.pp

#!/usr/bin/env bash
# install jdk 7#!/bin/bash

sudo rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
yum update -y

yum install zip unzip maven activemq java-1.7.0-openjdk puppet

echo -e "\n\nJAVA_HOME=/etc/alternatives/java_sdk_1.7.0_openjdk" >> /etc/environment;
export JAVA_HOME="/etc/alternatives/java_sdk_1.7.0_openjdk"
sed -i -e 's/^SELINUX=.*/SELINUX=permissive/' /etc/selinux/config
sudo service firewalld stop


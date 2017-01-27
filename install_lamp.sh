#!/bin/bash

# change repository
curl https://repogen.simplylinux.ch/txt/xenial/sources_f2704a9be47d8b45868631d198dc7c8d31040b96.txt | sudo tee /etc/apt/sources.list 

# update 
apt-get -y update

# install the LAMP stack
apt-get -y install git curl 


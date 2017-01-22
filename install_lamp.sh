#!/bin/bash

# change repository
curl https://repogen.simplylinux.ch/txt/xenial/sources_f2704a9be47d8b45868631d198dc7c8d31040b96.txt | sudo tee /etc/apt/sources.list 

# update 
apt-get -y update
apt-get -y upgrade

# install the LAMP stack
apt-get -y install git curl 
apt-get -y install apache2 
apt-get -y install php7.0 php7.0-common php7.0-curl php7.0-mysql php7.0-json php7.0-cgi php7.0-cli php7.0-odbc php7.0-sqlite3 php7.0-mcrypt php7.0-xml php7.0-soap php7.0-xmlrpc php7.0-gd php7.0-mbstring
apt-get -y install libapache2-mod-php7.0 
apt-get -y install mysql-server mysql-utilities mysql-common mysql-client libmysqlclient20
apt-get -y install phpmyadmin

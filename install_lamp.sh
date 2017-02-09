#!/bin/bash

# change repository
curl https://repogen.simplylinux.ch/txt/xenial/sources_f2704a9be47d8b45868631d198dc7c8d31040b96.txt | sudo tee /etc/apt/sources.list 

# update 
apt-get -y update

# install the LAMP stack
apt-get -y install git curl 

apt-get -y install apache2 
# Apache Test -> http://vm/localhost

apt-get -y install php7.0 libapache2-mod-php7.0 
# php --ini
sudo bash -c 'echo "<?php phpinfo(); ?>" > /var/www/html/infophp.php'


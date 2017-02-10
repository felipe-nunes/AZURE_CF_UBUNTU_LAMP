#!/bin/bash

# change repository
curl https://repogen.simplylinux.ch/txt/xenial/sources_f2704a9be47d8b45868631d198dc7c8d31040b96.txt | sudo tee /etc/apt/sources.list 

# update 
apt-get -y update

# set up a silent install of MySQL
dbpass=$1

export DEBIAN_FRONTEND=noninteractive
echo mysql-server mysql-server/root_password password $dbpass | sudo debconf-set-selections
echo mysql-server mysql-server/root_password_again password $dbpass | sudo debconf-set-selections

# install the LAMP stack
apt-get -y install git curl 

apt-get -y install apache2 
# Apache Test -> http://vm/localhost

apt-get -y install php7.0 libapache2-mod-php7.0 
# php --ini
sudo bash -c 'echo "<?php phpinfo(); ?>" > /var/www/html/infophp.php'

apt-get -y install php7.0-common php7.0-curl php7.0-mysql php7.0-json php7.0-cgi php7.0-cli php7.0-odbc php7.0-sqlite3 php7.0-mcrypt php7.0-xml php7.0-soap php7.0-xmlrpc php7.0-gd php7.0-mbstring

apt-get -y install mysql-server mysql-utilities mysql-common mysql-client libmysqlclient20

export DEBIAN_FRONTEND=noninteractive
apt-get -q -y phpmyadmin

echo phpmyadmin phpmyadmin/dbconfig-install boolean true | sudo debconf-set-selections
echo phpmyadmin phpmyadmin/app-password-confirm password $dbpass | sudo debconf-set-selections
echo phpmyadmin phpmyadmin/mysql/admin-pass password $dbpass | sudo debconf-set-selections
echo phpmyadmin phpmyadmin/mysql/app-pass password $dbpass | sudo debconf-set-selections
echo phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2 | sudo debconf-set-selections

sudo cp /etc/phpmyadmin/apache.conf /etc/apache2/conf-available/phpmyadmin.conf
sudo a2enconf phpmyadmin
sudo service apache2 restart



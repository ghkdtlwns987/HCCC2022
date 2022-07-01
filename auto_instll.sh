apt update -y
apt install -y apache2
apt intsall -y mysql-server
apt install -y vim
apt install -y php
apt install -y net-tools
apt install php-mysqli

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt install ./google-chrome-stable_current_amd64.deb


rm /etc/apache2/apache2.conf
cp ~/hccc2022_site/setup/apache2.conf /etc/apache2/apache2.conf

rm /etc/php/7.4/cli/php.ini
mv ~/hccc2022_site/setup/php.ini /etc/php/7.4/cli/php.ini

mysql -uroot -p <<EOFMYSQL
source ~/hccc2022_site/setup/schema.sql
show databases;
EOFMYSQL

rm -rf /var/www/html/*
mv ~/hccc2022_site/ /var/www/html/

service apache2 restart
service mysql restart

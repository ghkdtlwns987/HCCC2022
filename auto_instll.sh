apt update -y
apt install -y apache2
apt install -y mysql-server
apt install -y mysql-client
apt install -y vim
apt install -y php
apt install -y net-tools
apt install php-mysqli

rm /etc/apache2/apache2.conf
cp ~/HCCC2022/hccc2022_site/setup/apache2.conf /etc/apache2/apache2.conf

rm /etc/php/7.4/cli/php.ini
cp ~/HCCC2022/hccc2022_site/setup/php.ini /etc/php/7.4/cli/php.ini

mysql -uroot -p <<EOFMYSQL
source ~/HCCC2022/hccc2022_site/setup/schema.sql
show databases;
EOFMYSQL

rm -rf /var/www/html/*
cp ~/HCCC2022/hccc2022_site/html/* /var/www/html/

chown -R www-data:www-data /var/www/html    # apache2 권한 제한
chmod -R 777 /var/www/html/

service apache2 restart
service mysql restart

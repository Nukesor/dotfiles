#!/bin/zsh
sudo systemctl stop mysqld.service
echo "
"|sudo pacman -Rnsc mariadb
sudo rm -rf /var/lib/mysql
echo "1
Y
"|sudo pacman -S mysql
sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
sudo systemctl daemon-reload
sudo systemctl start mysqld.service
mysql_secure_installation


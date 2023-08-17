#!/bin/bash
yum update -y
yum install -y httpd php mysql php-mysql

systemctl start httpd
systemctl enable httpd

wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz -C /var/www/html/
mv /var/www/html/wordpress/* /var/www/html/
rm -rf /var/www/html/wordpress

chown -R apache:apache /var/www/html/
chmod -R 755 /var/www/html/

systemctl restart httpd

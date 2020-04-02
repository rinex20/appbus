#!/bin/sh

chown -R www:www /data/wwwroot/default/ 
chown -R www:www /data/wwwroot/default/upload 

chmod -R 0755 /data/wwwroot/default
chmod -R 0755 /data/wwwroot/default/upload

/etc/init.d/php-fpm start
/etc/init.d/mysqld start
/etc/init.d/nginx start

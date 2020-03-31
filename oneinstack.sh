#!/bin/sh

echo "downloading oneinstack..."
wget -O oneinstack-full.tar.gz http://mirrors.linuxeye.com/oneinstack-full.tar.gz  
tar xzf oneinstack-full.tar.gz  

cd oneinstack
chmod +x install.sh && ./install.sh \
 --nginx_option 1 --php_option 5 \
 --phpcache_option 1 --phpmyadmin  --db_option 3 \
 --dbinstallmethod 1 --dbrootpwd v4RdF92cn

echo "finish oneinstack installation."

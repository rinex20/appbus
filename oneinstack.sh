#!/bin/sh

# Download binary file
ONE_FILE="oneinstack-full.tar.gz"

echo "downloading oneinstack..."
wget -O /root/oneinstack-full.tar.gz http://mirrors.linuxeye.com/${ONE_FILE} > /dev/null 2>&1  
if [ $? -ne 0 ]; then
    echo "Error: Failed to download file: ${ONE_FILE}" && exit 1
fi
echo "Download file: ${ONE_FILE} completed"

tar xzf /root/oneinstack-full.tar.gz  

cd /root/oneinstack
chmod +x install.sh && ./install.sh \
 --nginx_option 1 --php_option 5 \
 --phpcache_option 1 --phpmyadmin  --db_option 3 \
 --dbinstallmethod 1 --dbrootpwd v4RdF92cn

echo "finish oneinstack installation."

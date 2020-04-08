#!/bin/sh

# Download binary file
ONE_FILE="oneinstack-full.tar.gz"
WWWROOT="/data/wwwroot/default"
URL_FILE="http://app.datagnss.com:8081/download"

echo "downloading oneinstack..."
# wget -O /root/${ONE_FILE} http://mirrors.linuxeye.com/${ONE_FILE} > /dev/null 2>&1  
wget -O /root/${ONE_FILE} ${URL_FILE}/${ONE_FILE} > /dev/null 2>&1  
if [ $? -ne 0 ]; then
    echo "Error: Failed to download file: ${ONE_FILE}" && exit 1
fi
echo "Download file: ${ONE_FILE} completed"

tar xzf /root/oneinstack-full.tar.gz  

chmod +x /root/oneinstack/install.sh \
  && /root/oneinstack/install.sh \
 --nginx_option 1 --php_option 5 \
 --phpcache_option 1 --phpmyadmin \
 --db_option 3 --dbinstallmethod 1 \
 --dbrootpwd v4RdF92cn

echo "finish oneinstack installation."
echo "remove oneinstack files."
rm -f ${WWWROOT}/index.html

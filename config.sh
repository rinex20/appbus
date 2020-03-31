#!/bin/sh

wget -c http://mirrors.linuxeye.com/oneinstack-full.tar.gz
tar xzf oneinstack-full.tar.gz
cd oneinstack
./install.sh --nginx_option 1 --php_option 5\
 --phpcache_option 1 --phpmyadmin  --db_option 3\
 --dbinstallmethod 1 --dbrootpwd v4RdF92cn

"Downloading appbus source code"
wget -O appbus.zip https://raw.githubusercontent.com/datagnss/appbus/master/raw/appbus.zip

unzip appbus.zip -d /data/wwwroot/default

cd /data/wwwroot/default

mv Install/apktool /usr/bin && chmod 0755 /usr/bin/apktool 
mv Install/apktool.jar /usr/bin && chmod 0755 /usr/bin/apktool.jar 
mv Install/aapt /usr/bin && chmod 0755 /usr/bin/aapt

chown -R www:www /data/wwwroot/default/ && \
chown -R www:www /data/wwwroot/default/upload 

chmod -R 0755 /data/wwwroot/default/ && \
chmod -R 0755 /data/wwwroot/default/upload

echo "Create config file for appbus nginx"
cat>/etc/nginx/conf.d/appbus-8081.conf<<EOF
>"listen 8081;"
>"server_name localhost;"
>EOF

service nginx restart

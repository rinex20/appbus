#!/bin/sh

PHP_INI="/usr/local/php/etc/php.ini"
N_CONF="/usr/local/nginx/conf/nginx.conf"
#wget -O appbus.zip https://raw.githubusercontent.com/datagnss/appbus/master/raw/appbus.zip 
#unzip appbus.zip -d /data/wwwroot/default

#cd /data/wwwroot/default

mv /data/wwwroot/default/Install/apktool /usr/bin
chmod 0755 /usr/bin/apktool
mv /data/wwwroot/default/Install/apktool.jar /usr/bin
chmod 0755 /usr/bin/apktool.jar
mv /data/wwwroot/default/Install/aapt /usr/bin 
chmod 0755 /usr/bin/aapt

chown -R www:www /data/wwwroot/default
chown -R www:www /data/wwwroot/default/upload 

chmod -R 0755 /data/wwwroot/default
chmod -R 0755 /data/wwwroot/default/upload

# delete exec in the line which contain disable_functions
echo "config php options(remove exec security, modify upload fileszie)"
sed -n '/disable_functions/p' ${PHP_INI} | sed 's/,exec//g' 
sed -n '/upload_max_filesize/p' ${PHP_INI} | sed 's/50/128/g'
sed -n '/post_max_size/p' ${PHP_INI} | sed 's/100/128/g'
#sed -i '$a upload_max_filesize = 128m' ${PHP_INI}
#sed -i '$a post_max_size = 128m' ${PHP_INI}

echo "config nginx.conf"
sed -n '/server_name _;/p' ${N_CONF} | sed 's/_/localhost/g'

echo "appbus configure finished."

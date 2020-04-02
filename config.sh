#!/bin/sh

PHP_INI="/usr/local/php/etc/php.ini"
N_CONF="/usr/local/nginx/conf/nginx.conf"

mv /root/apktool /usr/bin
chmod 0755 /usr/bin/apktool
mv /root/apktool.jar /usr/bin
chmod 0755 /usr/bin/apktool.jar
mv /root/aapt /usr/bin 
chmod 0755 /usr/bin/aapt

chown -R www:www /usr/local/nginx

mkdir -p /data/wwwroot/default/upload 

chown -R www:www /data/wwwroot/default
chown -R www:www /data/wwwroot/default/upload 

chmod -R 0755 /data/wwwroot/default
chmod -R 0755 /data/wwwroot/default/upload

# delete exec in the line which contain disable_functions
echo "config php options(remove exec security, modify upload fileszie)"
sed -n '/disable_functions/p' ${PHP_INI} | sed -i 's/,exec,/,/g'  ${PHP_INI}
sed -n '/upload_max_filesize/p' ${PHP_INI} | sed -i 's/50/128/g'  ${PHP_INI}
sed -n '/post_max_size/p' ${PHP_INI} | sed -i 's/100/128/g' ${PHP_INI}
#sed -i '$a upload_max_filesize = 128m' ${PHP_INI}
#sed -i '$a post_max_size = 128m' ${PHP_INI}

#echo "config nginx.conf"
sed -n '/server_name _;/p' ${N_CONF} | sed -i 's/_/localhost/g'  ${N_CONF}

echo "appbus configure finished."

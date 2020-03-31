#!/bin/sh

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
sed -n '/disable_functions/p' /usr/local/php/etc/php.ini | sed 's/exec,//g' 
sed -n '/upload_max_filesize/p' /usr/local/php/etc/php.ini | sed 's/upload_max_filesize/#upload_max_filesize/g'
sed -n '/post_max_size/p' /usr/local/php/etc/php.ini | sed 's/post_max_size/#post_max_size/g'
sed -i '$a upload_max_filesize = 128m' /usr/local/php/etc/php.ini
sed -i '$a post_max_size = 128m' /usr/local/php/etc/php.ini

echo "appbus configure finished."

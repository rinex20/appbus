FROM ubuntu:18.04
LABEL maintainer="Jacky <cheungyong@gmail.com>"

ENV ver=0.9

WORKDIR ~
ARG ARG_ONESTACK=http://mirrors.linuxeye.com/oneinstack-full.tar.gz
ARG ARG_APPBUS=https://raw.githubusercontent.com/datagnss/appbus/master/raw/appbus.zip
RUN wget -O oneinstack-full.tar.gz $ARG_ONESTACK\
  && tar xzf oneinstack-full.tar.gz \
  && cd oneinstack && chmod +x install.sh && ./install.sh\
      --nginx_option 1 --php_option 5 \
      --phpcache_option 1 --phpmyadmin  --db_option 3\
      --dbinstallmethod 1 --dbrootpwd vTrb8uh3C \
  && wget -O appbus.zip $ARG_APPBUS \
  && unzip appbus.zip -d /data/wwwroot/default\
  && cd /data/wwwroot/default && mv Install/apktool /usr/bin && chmod 0755 /usr/bin/apktool \
      mv Install/apktool.jar /usr/bin && chmod 0755 /usr/bin/apktool.jar \
      mv Install/aapt /usr/bin && chmod 0755 /usr/bin/aapt \

  && chown -R www:www /data/wwwroot/default/ && chown -R www:www /data/wwwroot/default/upload\ 
  && chmod -R 0755 /data/wwwroot/default/ && chmod -R 0755 /data/wwwroot/default/upload\




EXPOSE 8081

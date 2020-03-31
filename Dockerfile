FROM ubuntu:18.04
LABEL maintainer="Jacky <cheungyong@gmail.com>"

ENV ver=0.9

WORKDIR /root
COPY config.sh /root

RUN set -ex \ 
  && wget -O oneinstack-full.tar.gz http://mirrors.linuxeye.com/oneinstack-full.tar.gz \ 
  && tar xzf oneinstack-full.tar.gz \ 
  && chmod +x oneinstack/install.sh && oneinstack/install.sh \
 --nginx_option 1 --php_option 5 \
 --phpcache_option 1 --phpmyadmin  --db_option 3 \
 --dbinstallmethod 1 --dbrootpwd v4RdF92cn

RUN echo "Downloading appbus source code..."
RUN wget -O appbus.zip https://raw.githubusercontent.com/datagnss/appbus/master/raw/appbus.zip\
  && unzip appbus.zip -d /data/wwwroot/default\
  && cd /data/wwwroot/default/\
  && mv /data/wwwroot/default/Install/apktool /usr/bin && chmod 0755 /usr/bin/apktool\ 
  && mv /data/wwwroot/default/Install/apktool.jar /usr/bin && chmod 0755 /usr/bin/apktool.jar\
  && mv /data/wwwroot/default/Install/aapt /usr/bin && chmod 0755 /usr/bin/aapt

RUN chmod +x root/config.sh && ./config.sh
RUN service nginx restart

EXPOSE 8081

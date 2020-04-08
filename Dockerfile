FROM ubuntu:18.04
LABEL maintainer="Jacky <cheungyong@gmail.com>"

ENV ver=0.91

WORKDIR /root
ADD * /root/

#&& unzip appbus.zip -d /data/wwwroot/default \
RUN set -ex \   
  && apt-get update && apt-get install -y wget \
  && mkdir -p /data/wwwroot/default \
  && chmod +x /root/oneinstack.sh && /root/oneinstack.sh \  
  && chmod +x /root/config.sh && /root/config.sh \
  && cp /root/start.sh /usr/local/bin/ && chmod +x /usr/local/bin/start.sh \
  && rm -rf /root/*

# 环境变量
ENV PATH $PATH:/usr/local/php/bin:/usr/local/php/sbin:/usr/local/nginx/sbin
EXPOSE 80
VOLUME ["/data/wwwroot","/usr/local/nginx/conf/nginx.conf","/usr/local/php/etc/php.ini"]
#ENTRYPOINT ["/usr/local/bin/start.sh"]
CMD ["/usr/local/bin/start.sh"]

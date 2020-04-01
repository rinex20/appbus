FROM ubuntu:18.04
LABEL maintainer="Jacky <cheungyong@gmail.com>"

ENV ver=0.91

WORKDIR /root
ADD * /root

#&& unzip appbus.zip -d /data/wwwroot/default \
RUN set -ex \   
  && apt-get update && apt-get install -y wget \
  && mkdir /data/wwwroot/default \
  && chmod +x /root/oneinstack.sh && /root/oneinstack.sh \  
  && chmod +x /root/config.sh && /root/config.sh \
  && chmod +x /root/start.sh \
  && rm -f /root/*

EXPOSE 80
VOLUME ["/data/wwwroot/default"]
#ENTRYPOINT ["/root/start.sh"]
CMD ["/root/start.sh"]

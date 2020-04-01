FROM ubuntu:18.04
LABEL maintainer="Jacky <cheungyong@gmail.com>"

ENV ver=0.91

WORKDIR /root
ADD * /root

#
RUN set -ex \   
  && apt-get update && apt-get install -y wget \
  && chmod +x /root/oneinstack.sh && /root/oneinstack.sh \
  && unzip appbus.zip -d /data/wwwroot/default \
  && chmod +x /root/config.sh && /root/config.sh \
  && chmod +x /root/start.sh

EXPOSE 80
#VOLUME /etc/nginx/conf.d
ENTRYPOINT ["/root/start.sh && bash"]

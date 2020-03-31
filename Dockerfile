FROM alpine:latest
LABEL maintainer="Jacky <cheungyong@gmail.com>"

ENV ver=0.91

WORKDIR /root
COPY oneinstack.sh /root
COPY config.sh /root
COPY appbus.zip /root

#&& apt-get update && apt-get install -y wget \
RUN set -ex \   
  && chmod +x /root/oneinstack.sh && /root/oneinstack.sh \
  && unzip appbus.zip -d /data/wwwroot/default \
  && chmod +x /root/config.sh && /root/config.sh

EXPOSE 8081
VOLUME /etc/nginx/conf.d
ENTRYPOINT ["bash"]

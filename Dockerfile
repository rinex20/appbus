FROM ubuntu:18.04
LABEL maintainer="Jacky <cheungyong@gmail.com>"

ENV ver=0.9

WORKDIR /root
COPY oneinstack.sh /root
COPY config.sh /root
COPY appbus.zip /root

RUN set -ex \ 
  && apt-get update && apt-get install -y wget \
  && chmod +x /root/oneinstack.sh && /root/oneinstack.sh \
  && chmod +x /root/config.sh && /root/config.sh \

EXPOSE 8081

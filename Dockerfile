FROM ubuntu:18.04
LABEL maintainer="Jacky <cheungyong@gmail.com>"

ENV ver=0.9

WORKDIR /root
COPY config.sh /root
RUN chmod +x config.sh && ./config.sh


VOLUME /etc/nginx/conf.d
EXPOSE 8081

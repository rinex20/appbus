FROM ubuntu:18.04
LABEL maintainer="Jacky <cheungyong@gmail.com>"

ENV ver=0.9

WORKDIR /root
COPY oneinstack-full.tar.gz /root
RUN set -ex \

EXPOSE 8081

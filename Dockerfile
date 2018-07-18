FROM alpine

MAINTAINER tnllcweb@gmail.com

########################################################################
# Set up OS
########################################################################

WORKDIR /root

ENV CPPFLAGS=-s SHELL=/bin/bash

COPY util/* /usr/local/bin/

RUN \
   echo "### Init System ###" && \   
   sed -i $'1 i\http://ftp.yzu.edu.tw/Linux/alpine/v3.8/community' /etc/apk/repositories && \
   chmod +x /usr/local/bin/* && \
   echo "### Install /Asia/Taipei TimeZone ###" && \
   min-apk tzdata && \
   cp /usr/share/zoneinfo/Asia/Taipei /etc/localtime && \
   echo "Asia/Taipei" >  /etc/timezone

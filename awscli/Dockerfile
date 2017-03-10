FROM phusion/baseimage

MAINTAINER Joshua Hansen

RUN apt-get update && \
    apt-get install -y \
        python \
        python-pip && \
        pip install --upgrade pip && \
        pip install awscli

ENTRYPOINT ["aws"]



FROM ubuntu:latest

ENV CURATOR_VERSION="5.4.1"

RUN apt-get update -y && \
    apt-get install cron -y && \
    apt-get install python python-pip -y && \
    pip install --quiet elasticsearch-curator==${CURATOR_VERSION} && \
    rm -rf /var/lib/apt/lists/*

COPY etc/cron.d/* /etc/cron.d
COPY etc/curator /etc/curator

RUN chmod 644 /etc/cron.d/*

RUN crontab /etc/cron.d/*

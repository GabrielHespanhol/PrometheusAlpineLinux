FROM alpine

# Imagem para estudo do curso descomplicando o prometheus - Linuxtips
# A criação da imagem utilizou como base uma imagem criada por Jeferson Fernando - Badtuxx
# Imagem do badtuxx : https://github.com/badtuxx/prometheus_alpine
 
LABEL maintainer="Gabriel Lopes Hespanhol"
LABEL version="1.0"

ENV version 2.38.0

RUN apk update \
    && adduser -s /bin/false -D -H prometheus \
    && mkdir -p /etc/prometheus /var/lib/prometheus \
    && apk add curl \
    && curl -LO https://github.com/prometheus/prometheus/releases/download/v${version}/prometheus-${version}.linux-amd64.tar.gz \
    && tar -zxvf prometheus-${version}.linux-amd64.tar.gz \
    && cp prometheus-${version}.linux-amd64/promtool /usr/local/bin/ \
    && cp prometheus-${version}.linux-amd64/prometheus /usr/local/bin/ \
    && cp -R prometheus-${version}.linux-amd64/console_libraries/ /etc/prometheus/ \
    && cp -R prometheus-${version}.linux-amd64/consoles/ /etc/prometheus/ \
    && rm -rf prometheus-${version}.linux-amd64* \
    && chown prometheus:prometheus /usr/local/bin/prometheus \
    && chown prometheus:prometheus /usr/local/bin/promtool \
    && chown -R prometheus:prometheus /etc/prometheus \
    && chown prometheus:prometheus /var/lib/prometheus \
    && apk del curl  

VOLUME /etc/prometheus
VOLUME /var/lib/prometheus

ADD prometheus.yml /etc/prometheus/

ENTRYPOINT /usr/local/bin/prometheus \ 
            --config.file /etc/prometheus/prometheus.yml \ 
            --storage.tsdb.path /var/lib/prometheus/ \
            --web.console.libraries=/usr/share/prometheus/console_libraries \
            --web.console.templates=/usr/share/prometheus/consoles

EXPOSE 9090
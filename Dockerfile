FROM debian:12.10

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        rsyslog \
        rsyslog-elasticsearch \
        rsyslog-relp \
        librdkafka-dev && \
    rm -rf /var/lib/apt/lists/* \
           /var/log/* \
           /tmp/* \
           /var/tmp/* \
           /usr/share/doc/* \
           /usr/share/man/* \
           /usr/share/local/* \
           /usr/share/info/* \
           /usr/share/locale/* && \
    rm -f /etc/rsyslog.d/listen.conf

COPY rsyslog.conf /etc/rsyslog.conf

FROM debian:12.10

RUN echo 'deb http://deb.debian.org/debian sid main' > /etc/apt/sources.list.d/sid.list && \
    printf 'Package: *\nPin: release a=sid\nPin-Priority: 100\n' > /etc/apt/preferences.d/99sid

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      rsyslog \
      rsyslog-elasticsearch \
      rsyslog-relp \
      rsyslog-kafka && \
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
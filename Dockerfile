FROM debian:testing-slim

RUN apt-get update && apt-get install -y mpd \
    && apt-get clean && rm -fR /var/lib/apt/lists

RUN mkdir /music && mkdir /playlists && mkdir /mpd
VOLUME /mpd

COPY mpd.conf /
COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
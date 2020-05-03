#!/bin/sh
set -e

[ ! -f /mpd/mpd.conf ] && cp /mpd.conf /mpd/mpd.conf
touch \
  /mpd/tag_cache \
  /mpd/state \
  /mpd/sticker.sql \
  /mpd/db
chmod -R 666 /mpd

## start
exec mpd --no-daemon --stdout /mpd/mpd.conf "$@"

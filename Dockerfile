# Written in 2016 by Evan Prodromou <evan@fuzzy.ai>
#
# To the extent possible under law, the author(s) have dedicated all copyright
# and related and neighboring rights to this software to the public domain
# worldwide. This software is distributed without any warranty.
#
# You should have received a copy of the CC0 Public Domain Dedication along with
# this software. If not, see
# <http://creativecommons.org/publicdomain/zero/1.0/>.

FROM alpine:edge

RUN apk add \
  --no-cache \
  --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
  mongodb-tools

COPY backup-mongodb /etc/periodic/daily
RUN chmod +x /etc/periodic/daily/backup-mongodb

# Run Busybox crond in the foreground

CMD ["crond", "-f"]

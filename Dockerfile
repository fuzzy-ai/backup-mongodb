FROM alpine:edge

RUN apk add \
  --no-cache \
  --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
  mongodb-tools

COPY backup-mongodb /etc/periodic/daily
RUN chmod +x /etc/periodic/daily/backup-mongodb

# Run Busybox crond in the foreground

CMD ["crond", "-f"]

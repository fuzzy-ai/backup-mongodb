FROM alpine:edge

RUN apk add \
  --no-cache \
  --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
  mongodb-tools

COPY backup-mongodb /usr/local/bin/backup-mongodb
RUN echo "34 4	*	*	/usr/local/bin/backup-mongodb" /var/spool/cron/crontabs/root
RUN chmod +x /usr/local/bin/backup-mongodb

# Run Busybox crond in the foreground
# Error reporting level 2

CMD ["crond", "-f"]

FROM alpine:3.16
EXPOSE 6379

RUN apk add --no-cache "redis" \
	&& sed -i "s/^protected-mode yes/protected-mode no/" /etc/redis.conf \
	&& sed -i "s/^bind/# bind/" /etc/redis.conf \
	&& sed -i "s/^# maxmemory <bytes>/maxmemory 256mb/" /etc/redis.conf \
	&& sed -i "s/^# maxmemory-policy noeviction/maxmemory-policy allkeys-lru/" /etc/redis.conf

ENTRYPOINT [ "redis-server" ]
CMD [ "/etc/redis.conf" ]

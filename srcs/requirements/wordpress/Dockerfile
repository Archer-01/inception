FROM alpine:3.16
EXPOSE 9000

RUN sed -i 's/v3.16/v3.15/' /etc/apk/repositories \
	&& apk update \
	&& apk add --no-cache "php7-fpm" \
						  "php7-phar" \
						  "php7-json" \
						  "php7-openssl" \
						  "php7-mysqli" \
						  "php7-iconv" \
						  "mariadb-client" \
						  "curl"

COPY ./conf/php-fpm.conf /etc/php7/

COPY ./tools/bootstrap.sh /tmp/
ENTRYPOINT [ "/tmp/bootstrap.sh" ]

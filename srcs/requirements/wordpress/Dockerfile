FROM alpine:3.16
EXPOSE 9000

RUN sed -i 's/v3.16/v3.15/' /etc/apk/repositories \
	&& apk update \
	&& apk add --no-cache "curl" \
							"mariadb-client" \
							"php7" \
							"php7-fpm" \
							"php7-bcmath" \
							"php7-bz2" \
							"php7-calendar" \
							"php7-ctype" \
							"php7-curl" \
							"php7-dom" \
							"php7-exif" \
							"php7-fileinfo" \
							"php7-gd" \
							"php7-gmagick" \
							"php7-gmp" \
							"php7-iconv" \
							"php7-imap" \
							"php7-intl" \
							"php7-json" \
							"php7-mbstring" \
							"php7-mcrypt" \
							"php7-memcache" \
							"php7-mysqli" \
							"php7-openssl" \
							"php7-pcntl" \
							"php7-phar" \
							"php7-posix" \
							"php7-session" \
							"php7-shmop" \
							"php7-simplexml" \
							"php7-soap" \
							"php7-sockets" \
							"php7-sodium" \
							"php7-sysvsem" \
							"php7-sysvshm" \
							"php7-tokenizer" \
							"php7-xml" \
							"php7-xmlreader" \
							"php7-xmlwriter" \
							"php7-xsl" \
							"php7-zip" \
							"php7-zlib"

RUN adduser -S nginx && addgroup -S nginx
COPY ./conf/php-fpm.conf /etc/php7/

COPY ./web/index.html ./web/style.css /tmp/

RUN curl -O "https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar" \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/html/wordpress

COPY ./tools/php-fpm-setup.sh /tmp/
ENTRYPOINT [ "/tmp/php-fpm-setup.sh" ]

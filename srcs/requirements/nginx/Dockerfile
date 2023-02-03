FROM alpine:3.16
EXPOSE 443

RUN apk add --no-cache "nginx" "openssl"

COPY ./conf/nginx.conf /etc/nginx/

COPY ./tools/generate-ssl-certs.sh /tmp/
RUN [ "/tmp/generate-ssl-certs.sh" ]

ENTRYPOINT [ "nginx" ]

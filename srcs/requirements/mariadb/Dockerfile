FROM alpine:3.16
EXPOSE 3306

RUN apk add --no-cache "mariadb" "mariadb-client"

COPY ./conf/my.cnf /etc/

COPY ./tools/mariadb-setup.sh /tmp/
ENTRYPOINT [ "/tmp/mariadb-setup.sh" ]

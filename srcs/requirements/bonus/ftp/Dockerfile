FROM alpine:3.16

RUN apk add --no-cache "vsftpd"

COPY ./conf/vsftpd.conf /etc/vsftpd/
COPY ./tools/ftp-setup.sh /tmp/

ENTRYPOINT [ "/tmp/ftp-setup.sh" ]

EXPOSE 21
EXPOSE 4141-4242

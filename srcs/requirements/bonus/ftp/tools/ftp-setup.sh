#!/bin/sh

FTP_DIR="/var/www/html"

adduser $FTP_USER --disabled-password
echo "$FTP_USER:$FTP_PASSWORD" | chpasswd &> /dev/null

chown -R "$FTP_USER:$FTP_USER" $FTP_DIR

echo $FTP_USER >> "/etc/vsftpd/vsftpd.userlist"

vsftpd /etc/vsftpd/vsftpd.conf

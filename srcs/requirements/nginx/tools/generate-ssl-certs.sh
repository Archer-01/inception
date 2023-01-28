#!/bin/sh

SSL_DIR="/etc/ssl"
mkdir -p $SSL_DIR

KEY_FILE="$SSL_DIR/hhamza.42.fr.key"
CERT_FILE="$SSL_DIR/hhamza.42.fr.cert"

openssl req -x509 \
			-newkey rsa:2048 \
			-keyout $KEY_FILE \
			-out $CERT_FILE \
			-nodes \
			-subj "/C=MA/ST=Khouribga/O=1337 School/CN=hhamza.42.fr"

chown nginx:nginx $KEY_FILE $CERT_FILE

FROM alpine:3.16
EXPOSE 8000
EXPOSE 9443

RUN apk add --no-cache "curl" \
	&& curl --output portainer.tar.gz --location \
		"https://github.com/portainer/portainer/releases/download/2.17.0/portainer-2.17.0-linux-amd64.tar.gz" \
	&& tar -xvzf portainer.tar.gz

ENTRYPOINT [ "/portainer/portainer" ]

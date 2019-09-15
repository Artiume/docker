FROM alpine:latest
ENV VERSION = "1.0.49-r0"

LABEL maintainer.name="Anthony PERIQUET"
LABEL maintainer.email="anthony@periquet.net"
LABEL version=${VERSION}
LABEL description="Pure-FTPd is a fast, production-quality, standard-conformant FTP server, based upon Troll-FTPd "

ENV DEFAULT_USR             "username"
ENV DEFAULT_PWD             "password"
ENV DEFAULT_ROOT            "/opt/pure/datas/"
ENV FTP_CLIENTS             50
ENV FTP_CONNECTIONS         10

RUN apk update && \
    apk add --upgrade apk-tools  && \
    apk add libressl libressl2.7-libcrypto && \
    apk add expect pure-ftpd --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ && \
    mkdir -p /opt/pure/secure/ && \
    mkdir -p /opt/pure/datas/ && \
    adduser -HD -s /etc pure pftp

# Expose port
EXPOSE 21 30000-30009

VOLUME /opt/pure/secure/
VOLUME /opt/pure/datas/

COPY docker-entrypoint.sh /usr/local/bin/
RUN ln -s usr/local/bin/docker-entrypoint.sh /entrypoint.sh # backwards compat

ENTRYPOINT [ "docker-entrypoint.sh" ]

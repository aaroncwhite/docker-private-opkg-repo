from nginx:alpine as base

COPY nginx/. /etc/nginx/conf.d/
COPY bin/ /usr/bin/.

RUN apk update && \
    apk add git python && \
    git clone git://git.yoctoproject.org/opkg-utils && \
    cp /opkg-utils/* /usr/bin/ && \
    chmod -R 755 /usr/bin && \
    rm /etc/nginx/conf.d/default.conf
    
WORKDIR /opkg
EXPOSE 80
ENTRYPOINT [ "/usr/bin/start-opkg-server.sh" ]
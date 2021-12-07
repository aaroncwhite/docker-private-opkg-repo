FROM nginx:alpine as base

RUN apk update &&  \
    apk add git python3 && \
    rm /etc/nginx/conf.d/default.conf

COPY nginx/. /etc/nginx/conf.d/
COPY bin/ /usr/bin/.

RUN git clone -b 0.4.5 \
    https://git.yoctoproject.org/git/opkg-utils \
    -c advice.detachedHead=false && \
    rm -rf opkg-utils/tests && \
    cp /opkg-utils/* /usr/bin/ && \
    chmod -R 755 /usr/bin

WORKDIR /opkg
EXPOSE 80
ENTRYPOINT [ "/usr/bin/start-opkg-server.sh" ]

FROM alpine:latest AS build

ENV NGINX_VERSION 1.21.3
ENV OPENSSL_VERSION 1.1.1m

RUN set -e && \
    apk add --no-cache build-base pcre-dev zlib-dev perl linux-headers && \
    mkdir /src && \
    cd /src && \
    wget http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz && \
    wget https://www.openssl.org/source/openssl-${OPENSSL_VERSION}.tar.gz && \
    tar xvf nginx-${NGINX_VERSION}.tar.gz && \
    tar xvf openssl-${OPENSSL_VERSION}.tar.gz && \
    cd /src/nginx-${NGINX_VERSION} && \
    ./configure \
        --prefix=/var/www \
        --error-log-path=/var/log/nginx/error.log \
        --http-log-path=/var/log/nginx/access.log \
        --conf-path=/etc/nginx/nginx.conf \
        --pid-path=/run/nginx/nginx.pid \
        --lock-path=/run/nginx/nginx.lock \
        --sbin-path=/usr/bin/nginx \
        --builddir=/src/nginx-${NGINX_VERSION}/build \
        --with-http_v2_module \
        --with-http_realip_module \
        --with-http_auth_request_module \
        --with-http_ssl_module \
        --with-openssl=/src/openssl-${OPENSSL_VERSION} \
        --with-openssl-opt=enable-tls1_3 && \
    make -j 3

FROM alpine:latest 

ENV NGINX_VERSION 1.21.3

COPY --from=build /src/nginx-${NGINX_VERSION}/build /src/build
COPY --from=build /src/nginx-${NGINX_VERSION}/conf /src/conf
COPY --from=build /src/nginx-${NGINX_VERSION}/html /src/html

RUN set -e && \
    apk add --no-cach pcre && \
    addgroup -g 101 -S nginx && \
    adduser -S -D -H -u 101 -h /var/cache/nginx -s /sbin/nologin -G nginx -g nginx nginx && \
    mkdir /var/www && \
    cp -r /src/html /var/www && \
    cp /src/build/nginx /usr/bin/nginx && \
    mkdir /etc/nginx && \
    cp /src/conf/* /etc/nginx && \
    mkdir /etc/nginx/conf.d && \
    mkdir /run/nginx && \
    mkdir /var/log/nginx && \
    chown -R nginx:nginx /var/www/html && \
    rm -rf /src/* && \
    ln -sf /dev/stdout /var/log/nginx/error.log && \
    ln -sf /dev/stderr /var/log/nginx/access.log

COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

STOPSIGNAL SIGQUIT

CMD ["nginx", "-g", "daemon off;"]

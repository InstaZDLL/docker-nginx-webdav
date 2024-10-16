FROM ubuntu:noble

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    nginx \
    nginx-extras \
    libnginx-mod-http-dav-ext \
    libnginx-mod-http-auth-pam \
    apache2-utils

VOLUME /media
EXPOSE 80
COPY webdav.conf /etc/nginx/conf.d/default.conf
RUN rm /etc/nginx/sites-enabled/*

COPY entrypoint.sh /
RUN chmod +x entrypoint.sh
CMD ["/entrypoint.sh", "&&", "nginx", "-g", "daemon off;"]

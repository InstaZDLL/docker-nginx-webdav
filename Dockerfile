FROM ubuntu:noble

RUN apt-get update && apt-get install -y nginx nginx-extras libnginx-mod-http-dav-ext libnginx-mod-http-auth-pam

VOLUME /media
EXPOSE 80
COPY webdav.conf /etc/nginx/conf.d/default.conf
RUN rm /etc/nginx/sites-enabled/*

COPY entrypoint.sh /
RUN chmod +x entrypoint.sh
CMD ["/entrypoint.sh", "&&", "nginx", "-g", "daemon off;"]

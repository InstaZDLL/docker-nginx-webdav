FROM ubuntu:24.10

COPY --chmod=755 ./entrypoint.sh /usr/local/bin/
COPY --chmod=755 ./healthcheck.sh /usr/local/bin/

LABEL authors="Darwin Lamark" \
    maintainer="Darwin Lamark <contact@southlabs.fr>" \
    title="nginx-webdav" \
    description="WebDAV server based on Nginx" \
    base.name="docker.io/library/ubuntu:noble" \
    licenses="MIT" \
    source="https://github.com/InstaZDLL/nginx-webdav-sever" \
    vendor="the Docker Community" \
    version="2024.10"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    curl \
    nginx \
    nginx-extras \
    libnginx-mod-http-dav-ext \
    libnginx-mod-http-auth-pam \
    apache2-utils

COPY webdav.conf /etc/nginx/conf.d/default.conf

RUN rm /etc/nginx/sites-enabled/* && mkdir -p /ssl

VOLUME ["/media", "/ssl"]

EXPOSE 80 443

HEALTHCHECK --interval=5m --timeout=3s \
  CMD /usr/local/bin/healthcheck.sh || exit 1

ENTRYPOINT ["entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]

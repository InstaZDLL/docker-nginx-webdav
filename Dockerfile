FROM ubuntu:noble

COPY --chmod=755 ./entrypoint.sh /usr/local/bin/
COPY --chmod=755 ./healthcheck.sh /usr/local/bin/healthcheck.sh

LABEL authors="Darwin Lamark" \
    maintainer="Darwin Lamark <contact@southlabs.fr>" \
    title="docker-nginx-webdav" \
    description="Webdav server based on nginx" \
    documentation="https://github.com/InstaZDLL/docker-nginx-webdav" \
    base.name="docker.io/library/ubuntu:noble" \
    licenses="MIT" \
    source="https://github.com/InstaZDLL/docker-nginx-webdav" \
    vendor="the Docker Community" \
    version="1.0.0" \
    url="https://github.com/InstaZDLL/docker-nginx-webdav"

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

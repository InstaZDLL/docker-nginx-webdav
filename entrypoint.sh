#!/bin/bash
: "${TLS_DISABLE:-true}"
: "${OPTIMIZED_FTC:-true}"

if [ ! -f /docker-entrypoint-init.d/flagfile ]; then
    if [ "$TLS_DISABLE" = "false" ]; then
        echo "[info] TLS is enabled"
        openssl ecparam -genkey -name secp384r1 -out /ssl/private.pem
        openssl req -new -x509 -sha384 -key /ssl/private.pem -out /ssl/certificate.pem -days 365 -subj "/C=US/ST=State/L=City/O=Organization/OU=Unit/CN=localhost"
        echo "[info] Self-signed TLS certificate created"

        sed -i 's/listen 80;/listen 443 ssl;/' /etc/nginx/conf.d/default.conf
        sed -i '/listen 443 ssl;/a \
		\
		ssl_certificate /ssl/certificate.pem; \
		ssl_certificate_key /ssl/private.pem; \
		ssl_protocols TLSv1.2 TLSv1.3; \
		ssl_ciphers HIGH:!aNULL:!MD5;' /etc/nginx/conf.d/default.conf

        if [ "$OPTIMIZED_FTC" = "false" ]; then
            echo "[info] Optimized File Transfer Chunks is disabled"
            sed -i '1i server {\n    listen 80;,\n    return 301 https://$host$request_uri;\n}' /etc/nginx/conf.d/default.conf
        else
            echo "[info] Optimizing File Transfer Chunks ..."
            sed -i '1i sendfile_max_chunk 1m;\n\nserver {\n    listen 80;\n    return 301 https://$host$request_uri;\n}' /etc/nginx/conf.d/default.conf
        fi
        
        echo "[info] TLS configuration performed."
    else
        echo "[info] Skipping TLS configuration"
    fi

    if [[ -n "$USERNAME" ]] && [[ -n "$PASSWORD" ]]; then
        htpasswd -bc /etc/nginx/htpasswd $USERNAME $PASSWORD
        echo "[info] Authentication configuration performed."
    else
        echo "[info] Using no auth."
        sed -i 's%auth_basic "Restricted";% %g' /etc/nginx/conf.d/default.conf
        sed -i 's%auth_basic_user_file htpasswd;% %g' /etc/nginx/conf.d/default.conf
    fi
	echo "[info] Creating the flagfile"
    touch /docker-entrypoint-init.d/flagfile
else
    echo "[info] Nginx is already configured."
fi
echo "[info] Starting Nginx ..."

exec "$@"

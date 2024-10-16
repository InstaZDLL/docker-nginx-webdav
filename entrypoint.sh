#!/bin/bash
: "${TLS_DISABLE:-true}"


if [ "$TLS_DISABLE" = "false" ]; then
    echo "[Info] The WORDPRESS_COMPOSE env var is set to True"
    sleep 8
fi

if [[ -n "$USERNAME" ]] && [[ -n "$PASSWORD" ]]
then
	htpasswd -bc /etc/nginx/htpasswd $USERNAME $PASSWORD
	echo Done.
else
    echo Using no auth.
	sed -i 's%auth_basic "Restricted";% %g' /etc/nginx/conf.d/default.conf
	sed -i 's%auth_basic_user_file htpasswd;% %g' /etc/nginx/conf.d/default.conf
fi

exec "$@"

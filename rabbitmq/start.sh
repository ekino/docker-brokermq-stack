#!/bin/bash

echo "
        _    _
    ___| | _(_)_ __   ___
   / _ \ |/ / | '_ \ / _ \ 
  |  __/   <| | | | | (_) |
   \___|_|\_\_|_| |_|\___(_)

"
#set -x

echo "==> Defaults users"
sed -i 's/ADMIN_USER/'${ADMIN_USER:-admin}'/' /etc/rabbitmq/rabbitmq.config
sed -i 's/ADMIN_PASS/'${ADMIN_PASS:-changeme}'/' /etc/rabbitmq/rabbitmq.config

if [ -f "/etc/rabbitmq/definitions.json" ]
then
  echo "==> Loading definitions"
  sed -i '/load_definitions/s/%%//g' /etc/rabbitmq/rabbitmq.config
fi

echo "==> Starting RabbitMQ (with supervisord)"
echo
supervisord -n

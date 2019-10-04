#!/usr/bin/env sh

/entrypoint.sh mysqld &

sleep 5
echo "GRANT ALL PRIVILEGES ON ${MAGENTO_DATABASE}.* TO ${MYSQL_USER}@'%' IDENTIFIED BY '${MYSQL_PASSWORD}'; FLUSH PRIVILEGES" | mysql -u root -p${MYSQL_ROOT_PASSWORD} > /dev/null 2>&1

tail -f /dev/null

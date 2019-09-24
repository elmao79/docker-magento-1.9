#!/usr/bin/env sh

echo "GRANT ALL PRIVILEGES ON ${MAGENTO_DATABASE}.* TO ${MYSQL_USER}@'%' IDENTIFIED BY '${MYSQL_PASSWORD}'; FLUSH PRIVILEGES" | mysql -u root -p${MYSQL_ROOT_PASSWORD} > /dev/null 2>&1

/entrypoint.sh mysqld

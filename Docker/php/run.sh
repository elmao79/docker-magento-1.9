#!/bin/sh

# If APP_DIR is empty Magento files are descompressed there
if [ -z "$(ls -A ${APP_DIR})" ]; then
    tar xzvf /tmp/1.9.3.4.tar.gz -C /tmp
    mv /tmp/magento-mirror-1.9.3.4/* ${APP_DIR}/
    mv /tmp/magento-mirror-1.9.3.4/.h* ${APP_DIR}/
    mv /tmp/magento-mirror-1.9.3.4/.g* ${APP_DIR}/
    rm -Rf /tmp/magento-mirror-1.9.3.4
    rm /tmp/1.9.3.4.tar.gz
fi

php-fpm

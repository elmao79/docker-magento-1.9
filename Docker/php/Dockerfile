
FROM php:7.2-fpm-alpine

MAINTAINER OSCAR MARTIN "oscar@omartin.es"

ENV REFRESHED_AT 2019-09-20

RUN apk --no-cache add curl
RUN curl -sS https://getcomposer.org/installer | php; mv composer.phar /usr/local/bin/composer
ARG APP_DIR
ENV APP_DIR ${APP_DIR}
ENV PATH ${PATH}:${APP_DIR}/vendor/bin

COPY custom-php.ini /usr/local/etc/php/conf.d/

RUN apk add --no-cache $PHPIZE_DEPS openssl-dev
RUN pecl install xdebug && docker-php-ext-enable xdebug
RUN apk add --no-cache postgresql-dev
RUN docker-php-ext-install pdo_mysql && \
    docker-php-ext-install pdo_pgsql && \
    docker-php-ext-install pgsql && \
    docker-php-ext-install mysqli
RUN apk add --no-cache curl-dev && \
    docker-php-ext-install curl && \
    docker-php-ext-install exif && \
    docker-php-ext-install zip
RUN apk add --no-cache icu-dev gettext-dev
RUN docker-php-ext-install opcache && \
    docker-php-ext-install gettext && \
    docker-php-ext-install intl
RUN apk add --no-cache jpeg-dev libpng-dev freetype-dev
RUN docker-php-ext-configure gd \
    --enable-gd-native-ttf \
    --with-jpeg-dir=/usr/lib \
    --with-freetype-dir=/usr/include/freetype2 && \
    docker-php-ext-install gd
RUN apk add --no-cache libmcrypt libmcrypt-dev && \
    pecl install mcrypt-1.0.2 && \
    apk add --no-cache libxml2-dev && \
    docker-php-ext-install soap
RUN docker-php-ext-enable mcrypt

RUN wget -O phpunit https://phar.phpunit.de/phpunit-8.phar; chmod +x phpunit; mv phpunit /usr/local/bin/phpunit

ARG XDEBUG_IDEKEY
ARG XDEBUG_INI
ARG HOST_IP
RUN echo "xdebug.idekey = \"${XDEBUG_IDEKEY}\"" >> ${XDEBUG_INI} && \
    echo "xdebug.default_enable = 1" >> ${XDEBUG_INI} && \
    echo "xdebug.remote_enable = 1" >> ${XDEBUG_INI} && \
    echo "xdebug.remote_autostart = 1" >> ${XDEBUG_INI} && \
    echo "xdebug.remote_connect_back = 1" >> ${XDEBUG_INI} && \
    echo "xdebug.profiler_enable = 0" >> ${XDEBUG_INI} && \
    echo "xdebug.remote_host = \"${HOST_IP}\"" >> ${XDEBUG_INI} && \
    echo "xdebug.remote_port = 9000" >> ${XDEBUG_INI} && \
    echo "xdebug.cli_color = 0" >> ${XDEBUG_INI} && \
    echo "xdebug.var_display_max_children = -1" >> ${XDEBUG_INI} && \
    echo "xdebug.var_display_max_data = -1" >> ${XDEBUG_INI} && \
    echo "xdebug.var_display_max_depth = -1" >> ${XDEBUG_INI}

RUN wget https://codeload.github.com/OpenMage/magento-mirror/tar.gz/1.9.3.4 -O /tmp/1.9.3.4.tar.gz
#    tar xzvf /tmp/1.9.3.4.tar.gz -C /tmp && \
#    mv /tmp/magento-mirror-1.9.3.4/* ${APP_DIR}/ && \
#    mv /tmp/magento-mirror-1.9.3.4/.h* ${APP_DIR}/ && \
#    mv /tmp/magento-mirror-1.9.3.4/.g* ${APP_DIR}/
#RUN rm /tmp/1.9.3.4.tar.gz && rm -Rf /tmp/magento-mirror-1.9.3.4

COPY run.sh /run.sh

#CMD ['/run.sh']

WORKDIR ${APP_DIR}

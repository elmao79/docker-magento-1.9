
FROM php:7.2-fpm-alpine

MAINTAINER OSCAR MARTIN "oscar@omartin.es"

ENV REFRESHED_AT 2019-09-20

RUN apk --no-cache add curl
RUN curl -sS https://getcomposer.org/installer | php; mv composer.phar /usr/local/bin/composer
ARG APP_DIR
ENV APP_DIR ${APP_DIR}
ENV PATH ${PATH}:${APP_DIR}/vendor/bin

COPY custom-php.ini /usr/local/etc/php/conf.d/

#RUN curl https://github.com/OpenMage/magento-mirror/archive/1.9.3.4.tar.gz -o /tmp/1.9.3.4.tar.gz && \
#    tar xzvf /tmp/1.9.3.4.tar.gz -C /tmp

WORKDIR ${APP_DIR}

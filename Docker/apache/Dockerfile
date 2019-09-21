#
# Version: 1.0.1
#

FROM httpd:2.4-alpine

MAINTAINER OSCAR MARTIN "oscar@omartin.es"

ENV REFRESHED_AT 2019-09-20

COPY httpd-vhosts.conf /usr/local/apache2/conf/extra/httpd-vhosts.conf
COPY httpd.conf /usr/local/apache2/conf/httpd.conf

ARG APP_DIR
WORKDIR ${APP_DIR}

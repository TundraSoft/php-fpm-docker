FROM tundrasoft/alpine-base
LABEL maintainer="Abhinav A V<abhai2k@gmail.com>"

ENV FPM_PORT=9000\
  PHP_USER=$UNAME \
  PHP_GROUP=$GNAME

# @TODO - Make selection of these packages optional to keep the docker size small
# Ideally only the basic modules should be loaded, if required additional will be 
# installed when the docker spins up
RUN apk --update --no-cache add \
  libssh2-dev \
  php7 \
  php7-fpm \
  php7-mcrypt \
  php7-bcmath \
  php7-pdo \
  php7-pdo_mysql \
  php7-pdo_pgsql \
  php7-pdo_sqlite \
  php7-json \
  php7-dom \
  php7-ctype \
  php7-curl \
  php7-gd \
  php7-iconv \
  php7-intl \
  php7-opcache \
  php7-openssl \
  php7-phar \
  php7-posix \
  php7-soap \
  php7-xml \
  php7-zip \
  php7-zlib \
  php7-imagick \
  php7-mysqli \
  php7-pecl-ssh2 \
  && rm -rf /var/cache/apk/*

ADD /rootfs /

VOLUME [ "/var/log/php7", "/var/www", "/etc/php7" ]

# We do not "expose" any ports here. Basis configuration (/etc/php7/php-fpm.conf), use the publish option to get the same
# EXPOSE 9000

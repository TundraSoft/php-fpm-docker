# TundraSoft - PHP-FPM Docker

PHP is a popular general-purpose scripting language that is especially suited to web development.

Fast, flexible and pragmatic, PHP powers everything from your blog to the most popular websites in the world.

This docker implements the PHP language using the FPM module

# Usage

You can run the docker image by

## docker run

```
docker run \
 --name=php-fpm \
 -p 9191:9191 \
 -e TZ=Europe/London \
 -e FPM_PORT=9191 \
 -v php_data:/var/www \
 -v php_config:/etc/php7 \
 --restart unless-stopped \
 tundrasoft/php-fpm-docker:latest
```

## docker Create

```
docker create \
 --name=php-fpm \
 -p 9191:9191 \
 -e TZ=Europe/London \
 -e FPM_PORT=9191 \
 -v php_data:/var/www \
 -v php_config:/etc/php7 \
 --restart unless-stopped \
 tundrasoft/php-fpm-docker:latest
 --restart unless-stopped \
 tundrasoft/php-fpm-docker:latest
```

## docker-compose

```
version: "3.2"
services:
  mariadb:
    image: tundrasoft/php-fpm-docker:latest
    ports:
      - 9191:9191
    environment:
      - TZ=Europe/London
      - FPM_PORT=9191
    volumes:
      - php_data:/var/www# Where PHP files resides
      - php_config:/etc/php7 # PHP config files
    deploy:
      replicas: 1
      restart_policy:
        condition: on-failure
```

## Ports

By Default no port is exposed. Manually publish the port basis the ENV variable FPM_PORT.

## Variables

### TZ

The timezone to use.

### FPM_PORT

The port in which FPM should listen in.
Default is 9000

### PHP_USER

The User (non privilaged) with which the PHP FPM process must run.

Default - \$UNAME from alpine base - abc

### PHP_GROUP

The group (non privilaged) with which PHP FPM process must run

Default - \$GNAME from alpine base image - abc

## Volumes

### PHP_DATA - /var/www

Location where php files (root dir) is stored. This directory maps to /var/www

### PHP_CONFIG /etc/php7

Centralised PHP configuration files location. Maps to /etc/php7
This volume is optional, however it is highly recomended.

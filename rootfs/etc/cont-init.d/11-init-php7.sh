#!/usr/bin/with-contenv sh
# Variable Valiation
sed -i -e "s:{{ PHP_USER }}:$PHP_USER:" \
    -e "s:{{ PHP_GROUP }}:$PHP_GROUP:" \
    -e "s:{{ FPM_PORT }}:$FPM_PORT:" \
    /etc/php7/php-fpm.conf
  
sed -i -e "s:{{ TIME_ZONE }}:$TZ:" /etc/php7/conf.d/50-setting.ini
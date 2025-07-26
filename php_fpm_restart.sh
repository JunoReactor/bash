#!/bin/bash
# Путь к файлу лога
log_file="/var/log/php_fpm_restart.log"
# Проверяем статус php-fpm.service
status=$(systemctl is-active php-fpm.service)
if [ "$status" != "active" ]; then
    echo "$(date) - php-fpm.service не в активном состоянии. Перезапуск службы..." >> $log_file
    sudo systemctl restart php-fpm.service
else
    echo "$(date) - php-fpm.service работает в активном состоянии." >> $log_file
fi

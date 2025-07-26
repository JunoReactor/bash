#!/bin/bash

# Настройки
LOG_FILE="/var/log/mysql_restart.log"
SERVICE_NAME="mysql"  # Или "mariadb", если используется MariaDB

# Проверка прав root
if [ "$(id -u)" -ne 0 ]; then
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Ошибка: скрипт требует прав root." | tee -a "$LOG_FILE"
    exit 1
fi

# Проверка статуса сервиса
if ! systemctl is-active --quiet "$SERVICE_NAME"; then
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Сервис $SERVICE_NAME неактивен. Попытка перезапуска..." | tee -a "$LOG_FILE"
    
    # Перезапуск сервиса
    systemctl restart "$SERVICE_NAME"
    
    # Проверка успешности перезапуска
    if systemctl is-active --quiet "$SERVICE_NAME"; then
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] Сервис $SERVICE_NAME успешно перезапущен." | tee -a "$LOG_FILE"
    else
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] Ошибка: не удалось перезапустить $SERVICE_NAME." | tee -a "$LOG_FILE"
        # Дополнительная диагностика (необязательно)
        systemctl status "$SERVICE_NAME" >> "$LOG_FILE"
    fi
else
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Сервис $SERVICE_NAME работает нормально." >> "$LOG_FILE"
fi

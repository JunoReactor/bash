#!/bin/bash
status=$(systemctl is-active nginx.service)

if [ "$status" == "inactive" ]; then
    echo "Nginx не активен, перезапускаем..."
    systemctl restart nginx.service

    # Проверяем статус снова после перезапуска
    new_status=$(systemctl is-active nginx.service)
    if [ "$new_status" == "active" ]; then
        echo "Nginx успешно перезапущен."
    else
        echo "Не удалось перезапустить Nginx. Текущий статус: $new_status"
    fi
else
    echo "Статус Nginx: $status. Перезапуск не требуется."
fi

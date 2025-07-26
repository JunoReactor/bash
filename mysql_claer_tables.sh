#!/bin/bash

# Запуск:
# mysql_claer_tables.sh
# mysql_claer_tables.sh -y - без подтверждения очистки таблиц

# Параметры подключения к базе данных
DB_HOST="localhost"
DB_USER=" "
DB_NAME=" "
 
# Запрашиваем пароль один раз
read -sp "Введите пароль для базы данных: " DB_PASS
echo
 
# Массив таблиц для очистки
tables=(
    "b_search_content"
    "b_search_content_param"
    "b_search_content_right"
    "b_search_content_site"
    "b_search_content_stem"
    "b_search_content_text"
    "b_search_content_title"
    "b_search_stem"
    "b_search_tags"
)
 
# Инициализация счетчиков
total_deleted=0
 
# Путь к файлу лога
log_file="mysql_claer_tables_log.txt"
 
# Флаг для автоматического удаления
auto_delete=false
 
# Обработка аргументов командной строки
while getopts ":y" opt; do
    case $opt in
        y)
            auto_delete=true
            ;;
        \?)
            echo "Неверный флаг: -$OPTARG" >&2
            exit 1
            ;;
    esac
done
 
# Шаг 1: Вывод информации о размере данных
echo "Информация о размере данных в таблицах:"
for table in "${tables[@]}"; do
    count=$(mysql -u"$DB_USER" -p"$DB_PASS" -h"$DB_HOST" "$DB_NAME" -sse "SELECT COUNT(*) FROM $table;" 2>/dev/null)
     
    echo "Таблица $table: записей = $count"
     
    # Обновляем общие счетчики
    total_deleted=$((total_deleted + count))
done
 
# Запрашиваем у пользователя, хочет ли он удалить данные, если флаг не установлен
if [ "$auto_delete" = false ]; then
    echo "Общее количество записей для удаления: $total_deleted"
    read -p "Хотите удалить эти данные? (Y/N): " answer
else
    answer="Y"
    echo "Флаг -y установлен. Автоматически подтверждаем удаление."
fi
 
# Шаг 2: Удаление данных, если пользователь подтвердит
if [[ "$answer" =~ ^[Yy]$ ]]; then
    # Добавляем запись в лог о начале очистки
    echo "[$(date)] Начинаем очистку." >> "$log_file"
 
    for table in "${tables[@]}"; do
        # Удаляем все записи из таблицы
        mysql -u"$DB_USER" -p"$DB_PASS" -h"$DB_HOST" "$DB_NAME" -e "TRUNCATE TABLE $table;" 2>/dev/null
        echo "Очистка таблицы $table: данные удалены."
        # Записываем информацию об удалении в лог
        echo "[$(date)] Очистка таблицы $table: данные удалены." >> "$log_file"
    done
 
    echo "Данные успешно удалены."
    # Записываем итог в лог
    echo "[$(date)] Очистка завершена. Общее количество удаленных записей: $total_deleted" >> "$log_file"
else
    echo "Удаление данных отменено."
    # Записываем информацию об отмене в лог
    echo "[$(date)] Удаление данных отменено." >> "$log_file"
fi
 
# Вывод общих результатов
echo "Общее количество удаленных записей: $total_deleted"

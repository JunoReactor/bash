#!/bin/bash

# Установка даты
current_date=$(date +"%Y-%m-%d_%H-%M-%S")

# Запуск Python скрипта
echo "python your_script.py" > "log_${current_date}.txt"

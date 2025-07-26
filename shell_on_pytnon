#!/usr/bin/env python3

#./shell.sh

#+-------+------------+--------------------------+
#| Код   | Действие   | Описание                 |
#+=======+============+==========================+
#| [1]   | Запуск     | Запуск основного скрипта |
#+-------+------------+--------------------------+
#| [2]   | Настройки  | Конфигурация параметров  |
#+-------+------------+--------------------------+
#| [q]   | Выход      | Завершение программы     |
#+-------+------------+--------------------------+
#Выход...


from pyfiglet import Figlet
from simple_term_menu import TerminalMenu
from tabulate import tabulate
import subprocess

# ASCII-заголовок
f = Figlet(font='slant')
print(f.renderText('Меню'))

# Данные для таблицы (пункт меню | описание)
menu_data = [
    ["[1]", "Запуск", "Запуск основного скрипта"],
    ["[2]", "Настройки", "Конфигурация параметров"],
    ["[q]", "Выход", "Завершение программы"]
]

# Форматируем таблицу
headers = ["Код", "Действие", "Описание"]
print(tabulate(menu_data, headers=headers, tablefmt="grid"))

# Создаем меню из первых двух колонок
options = [f"{item[0]} {item[1]}" for item in menu_data]
menu = TerminalMenu(options)
choice = menu.show()

# Обработка выбора
if choice == 0:
    subprocess.run("bash script.sh", shell=True)
elif choice == 1:
    print("Переход в настройки...")
elif choice == 2:
    print("Выход...")
    exit()

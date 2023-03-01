#!/bin/bash
 
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
CYAN="\e[36m"
BOLDGREEN="\e[1;${GREEN}m"
ITALICRED="\e[3;${RED}m"
ENDCOLOR="\e[0m"

echo ''
echo -e "${CYAN}############################################${ENDCOLOR}"
echo -e "${RED}Удаление файлов согласно логу файлов${ENDCOLOR}"
echo -e "${CYAN}############################################${ENDCOLOR}"
echo -e "${ENDCOLOR}[Start]...${ENDCOLOR}"
echo ''
 
setArrayFromFile() 
{
    data=()
    while IFS="\r" read -r line 
    do
        string=`echo $line | tr -d '\r\n'`
        data+=("$string")
    done < "$1" 
}
 
setArrayFromFile $1 # "data2.txt" в лог файле должны быть указны пути внутри сервера до файлов

for file in "${data[@]}"
do
    if [ -z "$file" ]; then
        echo "[Пустой] $file"
        continue
    fi

    if [ -f "$file" ]; then
        echo -e "${YELLOW} [Удаляем] ${file} ${ENDCOLOR}"
        rm -f "$file"
    else
        echo -e "${RED} [Файла не существует] ${file} ${ENDCOLOR}"
    fi
done

echo ''
echo -e "${ENDCOLOR}...[End]${ENDCOLOR}"
echo -e "${RED}############################################${ENDCOLOR}"
ls /var/www/sibur.ru/www/delete/tst/

#!/bin/bash

# Проверка введенных аргументов

if [ $# -ne 2 ]; then
    echo "Использование: $0 'строка_для_поиска' путь_к_каталогу"
    exit 1
fi

# Переменные

search_string="$1"
catalog="$2"

# Проверка, существует ли введенный каталог
if [ ! -d "$catalog" ]; then
    echo "Ошибка: Данный каталог '$catalog' не существует"
    exit 1
fi

grep -r "$search_string" "$catalog"
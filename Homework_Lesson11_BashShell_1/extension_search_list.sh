#!/bin/bash

# Получение параметров

read -p "Введите название выводящего(output) файла:" outputfile
echo $outputfile

read -p "Введите имя каталога:" catalog
echo $catalog

read -p "Введите расширение файлов, которое вам необходимо:" extansion
echo $extansion 

# Переменные
outputfile=$1
catalog=$2
extansion=$3

# Проверка, существует ли данный каталог
if [ ! -d $catalog]; then
    echo "Ошибка: Данный каталог '$catalog' не существует"
    exit 1
fi

# Поиск файлов в заданном каталоге, с заданным расширением и вывод его в outputfile
find $catalog -type f -name *$extansion > $outputfile

echo "Список файлов с расширениями '$extansion' в файле '$outputfile'"

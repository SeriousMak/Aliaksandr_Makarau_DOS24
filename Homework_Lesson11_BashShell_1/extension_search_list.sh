#!/bin/bash

# Получение параметров

# Переменные
#outputfile="$1"
#catalog="$2"
#extansion="$3"

read -p "Введите название выводящего(output) файла: " outputfile
echo $outputfile

read -p "Введите имя каталога: " catalog
echo $catalog

# Проверка, существует ли введенный каталог
#echo "Проверяем каталог: '$catalog'"
if [ ! -d "$catalog" ]; then
    echo "Ошибка: Данный каталог '$catalog' не существует"
    exit 1
fi

read -p "Введите расширение файлов, которое вам необходимо: " extansion
echo $extansion 
if [[ "$extansion" != .* ]]; then
    echo "Ошибка: расширение файла должно начинаться с точки ."
    exit 1
fi

# Поиск файлов в заданном каталоге, с заданным расширением и вывод его в outputfile
find "$catalog" -type f -name "*$extansion" > "$outputfile"

echo "Список файлов с расширениями '$extansion' в файле '$outputfile'."

#!/bin/bash

# Получение параметров

read -p "Введите название выводящего(output) файла:" outputfile
echo $outputfile

read -p "Введите имя каталога:" catalog
echo $catalog

read -p "Введите расширение файлов, которое вам необходимо:" extantion
echo $extantion 

# Переменные
outputfile=$1
catalog=$2
extantion=$3

# Поиск файлов с заданным расширением и вывод его в outputfile
find $catalog -type f -name $extantion > $outputfile


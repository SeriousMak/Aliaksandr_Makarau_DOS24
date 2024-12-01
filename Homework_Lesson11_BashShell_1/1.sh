#!/bin/bash

#  Переменные
outputfile=$1
catalog=$2
extantion=$3

#Поиск файлов с заданным расширением и вывод его в outputfile
find $catalog -type f -name $extantion > $outputfile


#!/bin/bash

# Получение параметров

read -p "Введите файл, который нужно изменить:" file_name

echo $file_name

read -p "Введите нужное расширение:" new_ext

echo $new_ext

# Извлечение имени файла без расширения и новое имя
new_file_name="${file_name%.*}.${new_ext}"

mv "$file_name" "$new_file_name"
echo "Файл переименован в: $new_file_name"

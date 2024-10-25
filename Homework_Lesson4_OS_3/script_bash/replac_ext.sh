#!/bin/bash

# Получение параметров
file_name="$1"
new_ext="$2"

# Извлечение имени файла без расширения и новое имя
new_file_name="${file_name%.*}.${new_ext}"

mv "$file_name" "$new_file_name"
echo "Файл переименован в: $new_file_name"

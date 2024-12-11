#!/bin/bash

#Генерация логов
./gen_server.sh

successful_ip=$(grep 'status=200' server.log | grep -o 'ip=[^ ]*' | cut -d'=' -f2 | sort -u)

echo "Успешные IP-адреса status 200:"
echo "$successful_ip"

unsuccessful_users=$(grep 'status=403' server.log | grep -o 'user=[^ ]*' | cut -d'=' -f2 | sort -u)

echo "Пользователи с неудачным входом status 403:"
echo "$unsuccessful_users"

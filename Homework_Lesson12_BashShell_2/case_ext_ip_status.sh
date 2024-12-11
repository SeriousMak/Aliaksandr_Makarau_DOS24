#!/bin/bash

# Генерация логов
./gen_server.sh

read -p "Введите код ошибки: " status
echo $status

    case $status in
        "200")
            # Извлечение IP-адресов c статусом 200
            successful_ip=$(grep 'status=200' server.log | grep -o 'ip=[^ ]*' | cut -d'=' -f2 | sort -u)

                echo "Успешные IP-адреса status 200:"
                echo "$successful_ip"
            ;;
        "403")
            # Извлечение пользователей с статусом 403
            unsuccessful_users=$(grep 'status=403' server.log | grep -o 'user=[^ ]*' | cut -d'=' -f2 | sort -u)

                echo "Пользователи с неудачным входом status 403:"
                echo "$unsuccessful_users"

            ;;
        *)
                echo "Статус код не обработан"
            ;;
    esac



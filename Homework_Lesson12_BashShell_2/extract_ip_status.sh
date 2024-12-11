#!/bin/bash

#Генерация логов
./gen_server.sh

grep 'status=200' logfile | grep -o 'ip=[^ ]*' | cut -d'=' -f2 | sort -u

grep 'status=403' logfile | grep -o 'username=[^ ]*' | cut -d'=' -f2 | sort -u

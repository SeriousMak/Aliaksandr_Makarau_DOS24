#!/bin/bash

# Функция для запроса погоды
get_weather() {
    city=$1
    api_key="735bcdfdf9e553cad3a5bb2f7edec954" 
    url="api.openweathermap.org/data/2.5/forecast?q=${city}&appid=${api_key}"

    # Выполняем запрос к API
    response=$(curl -s $url)

    # Проверка на успешный ответ
    if [[ $(echo $response | jq -r '.cod') -ne 200 ]]; then
        echo "Ошибка: $(echo $response | jq -r '.message')"
        return 1
    fi

    # Вызываем функцию для отображения данных
    display_weather "$response"
}

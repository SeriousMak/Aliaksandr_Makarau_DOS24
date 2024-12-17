#!/bin/bash

# Функция для запроса погоды
get_weather() {
    local city=$1
    local api_key="735bcdfdf9e553cad3a5bb2f7edec954" 
    local url="https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=${api_key}&units=metric"

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

# Функция для отображения данных
display_weather() {
    local weather_data=$1

    local city=$(echo $weather_data | jq -r '.name')
    local country=$(echo $weather_data | jq -r '.sys.country')
    local temperature=$(echo $weather_data | jq -r '.main.temp')
    local description=$(echo $weather_data | jq -r '.weather[0].description')

    echo -e "Погода в ${city}, ${country}:\nТемпература: ${temperature}°C\nОписание: ${description}"
}

# Проверяем наличие аргумента
if [ -z "$1" ]; then
    echo "Использование: $0 <имя_города>"
    exit 1
fi


get_weather $1
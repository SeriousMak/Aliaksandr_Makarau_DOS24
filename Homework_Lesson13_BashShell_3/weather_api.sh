#!/bin/bash

# Функция для запроса погоды
get_weather() {
    city=$1
    api_key="735bcdfdf9e553cad3a5bb2f7edec954" 
    url="https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=${api_key}&units=metric&lang=ru"

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
    weather_data=$1

    country=$(echo $weather_data | jq -r '.sys.country')
    city=$(echo $weather_data | jq -r '.name')
    temperature=$(echo $weather_data | jq -r '.main.temp')
    min_temp=$(echo $weather_data | jq -r '.main.temp_min')
    max_temp=$(echo $weather_data | jq -r '.main.temp_max')
    pressure=$(echo $weather_data | jq -r '.main.pressure')
    humidity=$(echo $weather_data | jq -r '.main.humidity')
    description=$(echo $weather_data | jq -r '.weather[0].description')
    wind=$(echo $weather_data | jq -r '.wind.speed')

    echo "Погода в $city, $country"
    echo "Температура: $temperature°C"
    echo "Минимальная температура: $min_temp°C"
    echo "Максимальная температура: $max_temp°C"
    echo "Давление: $pressure гПа"
    echo "Влажность: $humidity %"
    echo "Описание: $description"
    echo "Скорость ветра: $wind м/с"
}

# Проверяем наличие аргумента
if [ -z "$1" ]; then
    echo "Использование: $0 <имя_города>"
    exit 1
fi


get_weather $1
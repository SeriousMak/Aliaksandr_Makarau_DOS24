# Указываем базовый образ
FROM ubuntu:20.04

# Обновляем пакетный менеджер и устанавливаем необходимые зависимости
RUN apt-get update && \
    apt-get install -y nginx curl && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /app/static	

# Копируем файл конфигурации nginx в контейнер
ADD tms.conf /etc/nginx/sites-available/

# Создание симлинка нашего сайта tms.by
RUN ln -s /etc/nginx/sites-available/tms.conf /etc/nginx/sites-enabled

# Копируем файлы из локального каталога /app/static
COPY static/ /app/static/

# Открываем порт 8080
EXPOSE 8080

# Команда для запуска nginx с указанным файлом конфигурации
CMD ["nginx", "-g", "daemon off;"]

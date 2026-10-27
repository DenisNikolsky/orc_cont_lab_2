# 1. Базовый образ
FROM python:3.11-slim

# 2. Метаданные
LABEL maintainer="nikolskiy@lab.local"
LABEL version="1.0"

# 3. Рабочая директория
WORKDIR /app

# 4. Сначала копируем requirements.txt (для кэширования слоёв)
COPY requirements.txt .

# 5. Устанавливаем зависимости
RUN pip install --no-cache-dir -r requirements.txt

# 6. Копируем исходный код приложения
COPY app/ ./app/

# 7. Открываем порт
EXPOSE 5521

# 8. Запуск приложения
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "5521"]

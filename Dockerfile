# Використовуємо мінімальний Python
FROM python:3.12-slim

# Встановлюємо Git для роботи з підмодулями
RUN apt-get update && apt install -y git

# Встановлюємо робочу директорію
WORKDIR /app

# Копіюємо залежності
COPY requirements.txt .

# Оновлення підмодулів
RUN git submodule update --init --recursive

# Встановлення Python-залежностей
RUN pip install --no-cache-dir -r requirements.txt

# Копіюємо увесь код
COPY . .

# Запускаємо FastAPI
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]

# Використовуємо мінімальний Python
FROM python:3.12-slim

# Встановлюємо Git
RUN apt-get update && apt-get install -y git
RUN python -m pip install --upgrade pip
# Встановлюємо робочу директорію
WORKDIR /app

# Копіюємо залежності
COPY requirements.txt .

# Встановлення Python-залежностей
RUN pip install --no-cache-dir -r requirements.txt

# Копіюємо увесь код (включно з підмодулями, якщо вони вже оновлені)
COPY . .

# Запускаємо FastAPI
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]

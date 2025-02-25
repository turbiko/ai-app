# Використовуємо мінімальний Python
FROM python:3.12-slim

# Встановлюємо робочу директорію
WORKDIR /app

# Копіюємо файли
COPY requirements.txt .
# Ініціалізація підмодуля
RUN git submodule update --init --recursive

RUN pip install --no-cache-dir -r requirements.txt



COPY . .

# Запускаємо FastAPI
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]

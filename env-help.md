# 📌 Використання python-decouple для роботи з .env файлами

# 1. Встановлення бібліотеки python-decouple
# Якщо ще не встановлено, встановіть python-decouple
# pip install python-decouple

from decouple import config, Csv

# 2. Використання змінних середовища з .env файлу
# .env файл:
# API_KEY="123456abcdef"
# DEBUG=True
# MAX_RETRIES=5
# PRICE=99.99
# ALLOWED_HOSTS=127.0.0.1,localhost,example.com
# SETTINGS={'mode': 'production', 'timeout': 30}

# 3. Читання змінних із .env
API_KEY = config("API_KEY", default="no-key")  # String
DEBUG = config("DEBUG", default=False, cast=bool)  # Boolean
MAX_RETRIES = config("MAX_RETRIES", default=3, cast=int)  # Integer
PRICE = config("PRICE", default=0.0, cast=float)  # Float
ALLOWED_HOSTS = config("ALLOWED_HOSTS", default="", cast=Csv())  # List
SETTINGS = config("SETTINGS", default="{}", cast=eval)  # Dictionary

# 4. Вивід значень
print(f"API_KEY: {API_KEY}")
print(f"DEBUG: {DEBUG}")
print(f"MAX_RETRIES: {MAX_RETRIES}")
print(f"PRICE: {PRICE}")
print(f"ALLOWED_HOSTS: {ALLOWED_HOSTS}")
print(f"SETTINGS: {SETTINGS}")

# AI App 🧠🚀

## Another App About AI

### 📌 Опис
**AI App** - це основа для проєктів зі штучним інтелектом, що використовує **FastAPI**, **Docker** та Python. Цей репозиторій створений як база для майбутніх AI-застосунків, які можна форкати та розширювати.

---

## 📂 Структура проєкту
```
ai-app/
│── app/
│   ├── main.py
│   ├── routes.py
│   ├── config.py
│── .env
│── Dockerfile
│── requirements.txt
│── README.md
│── .gitignore
│── run.sh
```

---

## 🚀 Запуск локально
```bash
python -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate
pip install -r requirements.txt
uvicorn app.main:app --reload
```

API буде доступний за адресою:
```
http://127.0.0.1:8000/docs
```

---

## 🐳 Запуск у Docker
```bash
docker build -t ai-app .
docker run -p 8000:8000 ai-app
```

---

## 🔗 API Ендпоїнти
- `GET /` – Головна сторінка
- `GET /btc_price` – Отримання поточної ціни BTC/USD

Документація OpenAPI:
```
http://127.0.0.1:8000/docs
```

---

## 🔧 Використання змінних оточення
Цей проєкт використовує **python-decouple** для роботи зі змінними середовища з `.env` файлу.

Файл `.env`:
```env
API_HOST=0.0.0.0
API_PORT=8000
```

Приклад використання у коді:
```python
from decouple import config

HOST = config("API_HOST", default="127.0.0.1")
PORT = config("API_PORT", default=8000, cast=int)
```

---

## 📌 Ліцензія
MIT License

================================================================

other git`s
Do not use simply "git pull" !

git submodule update --init --recursive
git pull --recurse-submodules

git submodule add https://github.com/turbiko/ai-base.git app/module

## delete git submodule
git submodule deinit -f app/module
rm -rf .git/modules/app/module
git rm -f app/module
git commit -m "Removed ai-base submodule"

## Run app
git submodule update --init --recursive
docker compose up -d


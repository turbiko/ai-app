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

## 📌 Ліцензія
MIT License


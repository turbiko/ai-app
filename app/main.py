from fastapi import FastAPI
from app.routes import router
from app.module.ai_core import AICore  # Імпорт з підмодуля
import os

app = FastAPI(title="AI App", version="1.0")

app.include_router(router)

# Ініціалізація AI ядра
ai_engine = AICore()

@app.get("/")
def home():
    return {"message": "Welcome to AI App", "ai_status": ai_engine.status()}

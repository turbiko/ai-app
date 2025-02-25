from fastapi import FastAPI
from app.routes import router
import os

app = FastAPI(title="AI App Base", version="1.0")

app.include_router(router)

@app.get("/")
def home():
    return {"message": "Welcome to AI App Base!"}

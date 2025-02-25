from fastapi import APIRouter
import requests
import os

router = APIRouter()

API_URL = "https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd"

@router.get("/btc_price")
def get_btc_price():
    response = requests.get(API_URL)
    data = response.json()
    price = data["bitcoin"]["usd"]
    return {"BTC Price (USD)": price}


from fastapi import APIRouter
import requests
import os

router = APIRouter()

API_URL = "https://api.coindesk.com/v1/bpi/currentprice/BTC.json"

@router.get("/btc_price")
def get_btc_price():
    response = requests.get(API_URL)
    data = response.json()
    price = data["bpi"]["USD"]["rate"]
    return {"BTC Price (USD)": price}

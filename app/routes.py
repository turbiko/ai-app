from fastapi import APIRouter
import requests
import os
import logging
from cachetools import TTLCache


logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

cache = TTLCache(maxsize=10, ttl=30)  # Кешуємо на 30 секунд

router = APIRouter()

API_URLS = [
    "https://api.binance.com/api/v3/ticker/price?symbol=BTCUSDT",
]

# @router.get("/btc_price")
def get_btc_price():
    for url in API_URLS:
        try:
            response = requests.get(url, timeout=5)
            response.raise_for_status()
            data = response.json()
            if "bitcoin" in data:
                return {"BTC Price (USD)": data["bitcoin"]["usd"]} # binance
            elif "price" in data:
                return {"BTC Price (USD)": data["price"]}  # other source api variants
        except requests.exceptions.RequestException as e:
            logger.error(f"API error ({url}): {e}")
            continue
    return {"error": "All APIs failed"}

@router.get("/btc_price")
def get_cached_btc_price():
    if "btc_price" in cache:
        return cache["btc_price"]
    price_data = get_btc_price()
    cache["btc_price"] = price_data
    return price_data
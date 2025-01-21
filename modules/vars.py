import os

API_ID    = os.environ.get("API_ID", "21430928")
API_HASH  = os.environ.get("API_HASH", "262f6f06cc000539cc23394a3eb6957d")
BOT_TOKEN = os.environ.get("BOT_TOKEN", "7411593080:AAGavlg0cD5icWIHoLOSXSnzuHcSXzPIHTg") 

WEBHOOK = True  # Don't change this
PORT = int(os.environ.get("PORT", 8080))  # Default to 8000 if not set

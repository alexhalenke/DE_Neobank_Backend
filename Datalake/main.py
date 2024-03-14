from upload_users_devices import upload_to_lake
from datetime import datetime
import pandas as pd

def main():
    date_today = datetime.now().strftime("%Y-%m-%d")

    users = "Data/users.csv"
    devices = "Data/devices.csv"
    transactions = "Data/transactions.csv"
    notificatons = "Data/notifications.csv"
    upload_to_lake(devices)
    upload_to_lake(users)
    upload_to_lake(transactions)
    upload_to_lake(notificatons)

if __name__ == "__main__":
    main()

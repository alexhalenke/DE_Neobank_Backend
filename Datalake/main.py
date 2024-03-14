from upload_users_devices import upload_to_lake
from datetime import datetime
import pandas as pd

def main():
    date_today = datetime.now().strftime("%Y-%m-%d")
    users = pd.read_csv("Data/users.csv")
    devices = pd.read_csv("Data/devices.csv")
    upload_to_lake(devices)
    upload_to_lake(users)


if __name__ == "__main__":
    main()

from upload_users_devices import upload_to_lake_static, upload_to_lake_dynamic
import pandas as pd
import os

def main():

    static_files = [
        "users.csv",
        "devices.csv"
    ]

    dynamic_file = [
        "transactions.csv",
        "notifications.csv"
    ]


    for file_name in static_files:
        file_path = os.path.join("Data", file_name)
        upload_to_lake_static(file_path)

    for file_name in dynamic_file:
        file_path = os.path.join("Data", file_name)
        upload_to_lake_dynamic(file_path)


if __name__ == "__main__":
    main()

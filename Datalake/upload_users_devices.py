from google.cloud import storage
import os
import pandas as pd
from datetime import datetime



def upload_to_lake_static(file_name: str) -> None:

    file_name_path = file_name.split("/")[1]
    blob_path = f"raw/neobank/static/{file_name_path}"

    storage_client = storage.Client()

    bucket_name = os.environ["LAKE_BUCKET"]
    bucket = storage_client.bucket(bucket_name)

    blob = bucket.blob(blob_path)
    blob.upload_from_filename(file_name)
    print(f"File {file_name} uploaded to {blob_path}.")

def upload_to_lake_dynamic(file_name: str) -> None:

    date_column = "created_date"

    df = pd.read_csv(file_name, low_memory=False)
    df[date_column] = pd.to_datetime(df[date_column], errors='coerce')
    df.dropna(subset=[date_column], inplace=True)
    df['Year'] = df[date_column].dt.year
    df['Month'] = df[date_column].dt.month
    unique_years = df['Year'].unique()
    unique_months = df['Month'].unique()

    storage_client = storage.Client()
    bucket_name = os.environ["LAKE_BUCKET"]
    bucket = storage_client.bucket(bucket_name)

    for year in unique_years:
        for month in unique_months:
            filtered_df = df[(df['Year'] == year) & (df['Month'] == month)]
            if not filtered_df.empty:
                blob_path = f"raw/neobank/dynamic/{year}/{month}/{file_name.split('/')[-1]}"

                # Write filtered DataFrame to CSV file
                filtered_file_name = f"{year}-{month}_{file_name.split('/')[-1]}"
                filtered_df.to_csv(filtered_file_name, index=False)

                blob = bucket.blob(blob_path)
                blob.upload_from_filename(filtered_file_name)
                print(f"File {file_name} uploaded to {blob_path}.")

                os.remove(filtered_file_name)

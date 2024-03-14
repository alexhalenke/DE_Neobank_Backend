from datetime import datetime
from google.cloud import storage
import os


def upload_to_lake(file_name: str) -> None:
    """
    Uploads a file to a GCP bucket, organizing it in a data lake's raw zone with a date-based structure.

    Args:
    - file_name (str): The name of the file to upload.

    Returns:
    None
    """
    date_today = datetime.now()
    year = date_today.strftime("%Y")

    blob_path = f"raw/neobank/neobank/{year}/Static/{file_name}"

    storage_client = storage.Client()

    bucket_name = os.environ["LAKE_BUCKET"]
    bucket = storage_client.bucket(bucket_name)

    blob = bucket.blob(blob_path)
    blob.upload_from_filename(file_name)
    print(f"File {file_name} uploaded to {blob_path}.")

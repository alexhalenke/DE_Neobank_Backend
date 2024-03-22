from google.cloud import bigquery
from google.cloud import storage
def export_csv_to_bigquery(gcs_bucket_name, dataset_id, table_id, project_id=None):
    # Initialize BigQuery client
    bq_client = bigquery.Client(project=project_id)
    # Initialize GCS client
    storage_client = storage.Client()
    # Define BigQuery dataset and table references
    dataset_ref = bq_client.dataset(dataset_id)
    table_ref = dataset_ref.table(table_id)
    # Configure the job options
    job_config = bigquery.LoadJobConfig()
    job_config.source_format = bigquery.SourceFormat.CSV
    job_config.skip_leading_rows = 1  # If your CSV has headers, skip the first row
    job_config.autodetect = True
    # Loop through each CSV file in the GCS bucket
    for file_name in ['devices.csv', 'transactions.csv', 'notifications.csv', 'users.csv']:
        source_uri = f"gs://{gcs_bucket_name}/{file_name}"
        # Start the BigQuery job to load data from GCS
        load_job = bq_client.load_table_from_uri(
            source_uri,
            table_ref,
            job_config=job_config
        )
        # Wait for the job to complete
        load_job.result()
        print(f"Data loaded from {source_uri} to BigQuery table {table_ref.path} successfully.")
# Replace these variables with your specific values
gcs_bucket_name = "neobank-bk-lns"
dataset_id = "neobankproject-417719.bronze20241903"
table_id = ""
project_id = "neobankproject-417719"  # Optional: if None, will use the default project from your credentials
# Call the function to export CSV files from GCS to BigQuery
export_csv_to_bigquery(gcs_bucket_name, dataset_id, table_id, project_id)

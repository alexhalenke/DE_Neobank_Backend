from google.cloud import bigquery
from google.cloud import storage
from de_neobank_backend.pipeline.schemas import bigquery_schemas

"""
def rename_type_to_field_type(schema_dict):
    for _, fields in schema_dict.items():
        for field in fields:
            if "type" in field:
                field["field_type"] = field.pop("type")
    return schema_dict
"""




def main():
    bq_client = bigquery.Client()
    gcs_client = storage.Client()

    dataset_name = "sourcefiles"

    # updated_schemas = rename_type_to_field_type(bigquery_schemas)

    for table_name, schema in bigquery_schemas.items():
        print(f"Uploading data for {table_name}")

        # Setting filepath to read processed file from
        bucket_name = "neobank-bk-lns"

        file_path = f"gs://{bucket_name}/raw/neobank/*{table_name}.csv"
        table_id = f"{bq_client.project}.{dataset_name}.{table_name}"
        job_config = bigquery.LoadJobConfig(
            source_format=bigquery.SourceFormat.CSV,
            field_delimiter=",",
            schema=schema,
            autodetect=True,
        )
        job = bq_client.load_table_from_uri(
            file_path, table_id, job_config=job_config
        )
        job.result()


if __name__ == "__main__":
    # print(rename_type_to_field_type(bigquery_schemas))
    main()


"""
for table_name in bigquery_schemas.keys():
        table_ref = client.dataset(dataset_name).table(table_name)

        data_source = f"data/processed/{table_name}.csv"

        print(table_ref)
        print(data_source)
        job_config = bigquery.LoadJobConfig(source_format = bigquery.SourceFormat.CSV, skip_leading_rows=1,autodetect=True)


        with open(data_source,'rb') as source_file:
            job = client.load_table_from_file(source_file, table_ref)
"""

from de_neobank_backend.pipeline.schemas import bigquery_schemas
from google.cloud import bigquery


def main():
    """
    Main function to take the bigquery schemas and create the tables in the raw dataset.
    """
    client = bigquery.Client()
    dataset_name = "sourcefiles"

    dataset_ref = client.dataset(dataset_name)

    for table_name, schema in bigquery_schemas.items():
        # Table reference

        table_ref = dataset_ref.table(table_name)

        # Define the schema for the table
        table_schema = [
            bigquery.SchemaField(field["name"], field["type"], mode=field["mode"])
            for field in schema
        ]

        # Create the table
        table = bigquery.Table(table_ref, schema=table_schema)
        table = client.create_table(table)  # API request

        print(f"Table {table_name} created successfully.")


if __name__ == "__main__":
    main()

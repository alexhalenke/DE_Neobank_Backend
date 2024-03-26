from pipeline.schemas import bigquery_schemas
from google.cloud import bigquery


def main():
    """
    Main function to take the bigquery schemas and create the tables in the raw dataset.
    """
    client = bigquery.Client()
    dataset_name = "neobankraw"

    for table_name, schema in bigquery_schemas.items():
        # $CHALLENGIFY_BEGIN
        dataset_ref = bigquery.DatasetReference(client.project, dataset_name)
        table_ref = dataset_ref.table(table_name)
        table = bigquery.Table(table_ref, schema=schema)

        try:
            client.create_table(table)
            print(f"Created table {table_name}")
        except Exception as e:
            if "Already Exists: Table" in str(e):
                print(f"{table_name} already exists")
                client.update_table(table, ["schema"])
            else:
                raise e
        # $CHALLENGIFY_END


if __name__ == "__main__":
    main()

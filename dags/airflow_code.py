import os

from airflow import DAG

import pendulum

from airflow.operators.bash import BashOperator


DBT_DIR = os.getenv("DBT_DIR")


with DAG(
    "airflow_code",
    default_args={
        "depends_on_past": True,
    },
    start_date=pendulum.today("UTC").add(days=-1),
    schedule_interval="@daily",
    catchup=False,
) as dag:
    dbt_run = BashOperator(
        task_id="dbt_run",
        bash_command=f"dbt run --project-dir {DBT_DIR}",
    )

{{ config(materialized='table') }}

WITH DateParts AS (
  SELECT
    EXTRACT(YEAR FROM CAST(created_date AS DATE)) AS year,
    LPAD(CAST(EXTRACT(MONTH FROM CAST(created_date AS DATE)) AS STRING), 2, '0') AS month,
    LPAD(CAST(EXTRACT(DAY FROM CAST(created_date AS DATE)) AS STRING), 2, '0') AS day
  FROM
    `dbt_alexhalenke_silver_23032024.transaction_table`
)
SELECT
  CAST(CONCAT(year, month, day) AS INTEGER) AS date_ID,
  year,
  CAST(month AS INTEGER) AS month,
  CAST(day AS INTEGER) AS day
FROM
  DateParts
GROUP BY
  date_ID, year, month, day
ORDER BY
  date_ID

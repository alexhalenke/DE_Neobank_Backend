

WITH cte_date AS (
  SELECT
    created_date,
    EXTRACT(YEAR FROM created_date) AS year,
    EXTRACT(MONTH FROM created_date) AS month,
    EXTRACT(DAY FROM created_date) AS day
  FROM
    {{ source('bronze', 'transactions') }}
)

SELECT
  CAST(CONCAT(year, LPAD(CAST(month AS STRING), 2, '0'), LPAD(CAST(day AS STRING), 2, '0')) AS INTEGER) AS date_id,
  year,
  month,
  day
FROM
  cte_date

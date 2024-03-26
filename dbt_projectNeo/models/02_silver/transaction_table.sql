{{ config(materialized='table') }}

SELECT
  CAST(ea_merchant_mcc AS STRING) AS ea_merchant_mcc,
  REGEXP_REPLACE(transaction_id, '^transaction_', '') AS transaction_id,
  REGEXP_REPLACE(user_id, '^user_', '') AS user_id,
  CONCAT(FORMAT_TIMESTAMP('%H:%M:%S', TIMESTAMP(created_date)), ' ', FORMAT_TIMESTAMP('%Z', TIMESTAMP(created_date))) AS datime_with_timezone,
  FORMAT_TIMESTAMP('%Y-%m-%d', TIMESTAMP(created_date)) AS created_date,
  * EXCEPT (user_id, transaction_id, ea_merchant_mcc, created_date) -- Exclude the columns already transformed


FROM
  `Bronze_Tier.transactions`

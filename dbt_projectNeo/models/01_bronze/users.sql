{{ config(materialized='table') }}

SELECT
  REGEXP_REPLACE(CAST(user_id AS STRING), '^user_', '') AS user_id,
  FORMAT_TIMESTAMP('%Y-%m-%d', TIMESTAMP(created_date)) AS created_date,
  CONCAT(FORMAT_TIMESTAMP('%H:%M:%S', TIMESTAMP(created_date)), ' ', FORMAT_TIMESTAMP('%Z', TIMESTAMP(created_date))) AS date_time_with_timezone,
  * EXCEPT (user_id, created_date) -- Exclude the columns already transformed
FROM
  `Bronze_Tier.users`

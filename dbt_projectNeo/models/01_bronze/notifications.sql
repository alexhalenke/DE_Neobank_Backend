{{ config(materialized='table') }}

SELECT
  REGEXP_REPLACE(user_id, '^user_', '') AS user_id,
  CONCAT(FORMAT_TIMESTAMP('%H:%M:%S', TIMESTAMP(created_date)), ' ', FORMAT_TIMESTAMP('%Z', TIMESTAMP(created_date))) AS datime_with_timezone,
  FORMAT_TIMESTAMP('%Y-%m-%d', TIMESTAMP(created_date)) AS created_date,
  * EXCEPT (created_date, user_id) -- Exclude the columns already transformed
FROM
  `sourcefiles.notifications`

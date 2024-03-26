{{ config(materialized='table') }}

select
  TRIM(user_id, 'user_') AS user_id,
  FORMAT_TIMESTAMP('%Y-%m-%d', TIMESTAMP(created_date)) AS created_date,
  IFNULL(attributes_notifications_marketing_push, 0) AS marketing_notif_push,
  IFNULL(attributes_notifications_marketing_email, 0) AS marketing_notif_email,
  CONCAT(FORMAT_TIMESTAMP('%H:%M:%S', TIMESTAMP(created_date)), ' ', FORMAT_TIMESTAMP('%Z', TIMESTAMP(created_date))) AS date_time_with_timezone,
  * EXCEPT (user_id, created_date, attributes_notifications_marketing_push, attributes_notifications_marketing_email) -- Exclude the columns already transformed

from
  {{source('bronze', 'users') }}

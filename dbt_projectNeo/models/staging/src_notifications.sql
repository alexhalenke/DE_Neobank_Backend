{{ config(materialized='table') }}
select
  reason,
  channel,
  status,
    cast(replace(user_id,'user_', '') as integer) as user_id,
  YEAR(created_date) * 10000 + MONTH(created_date) * 100 + DAY(created_date) as create_date_key,
  created_date

from {{ ref('src_bronzetiers') }}
where type ="notifications"

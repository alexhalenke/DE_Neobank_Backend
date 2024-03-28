{{ config(materialized='table') }}

SELECT
  d.device_type , --key
  n.reason,
  n.channel, --key
  n.status,
  n.user_id, --key
  n.created_date,
  n.datime_with_timezone


FROM  {{ ref('notifications') }} as n
INNER JOIN  {{ ref( 'devices') }} as d
ON n.user_id = d.user_id

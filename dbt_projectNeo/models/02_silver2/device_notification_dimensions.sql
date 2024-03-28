{{ config(materialized='table') }}

SELECT
  d.device_type , --key
  n.reason,
  n.channel, --key
  n.status,
  n.user_id, --key
  n.created_date,
  n.datime_with_timezone


FROM `Silver_Tier.notification_table` as n
INNER JOIN `Silver_Tier.device_table` as d
ON n.user_id = d.user_id

{{ config(materialized='table') }}

select
  'string_field_0' AS device_type,
  TRIM(string_field_1, 'user_') AS user_id

from
  {{source('bronze', 'devices') }}

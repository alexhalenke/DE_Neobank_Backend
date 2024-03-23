{{ config(materialized='table') }}

select
  REPLACE(CAST(string_field_0 AS STRING), 'string_field_0', '') as device_type,
  REPLACE(REGEXP_REPLACE(CAST(string_field_1 AS STRING), '^string_field_1', ''), 'user_id', '') as user_id
from
  `Bronze_Tier.devices`

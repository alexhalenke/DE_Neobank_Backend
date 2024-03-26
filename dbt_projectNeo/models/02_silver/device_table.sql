{{ config(materialized='table') }}

SELECT
  string_field_0 AS device_type,
  REGEXP_REPLACE(CAST(string_field_1 AS STRING), '^user_', '') AS user_id
FROM
  `Bronze_Tier.devices`
WHERE
  string_field_0 != 'string_field_0' AND string_field_1 != 'string_field_1'

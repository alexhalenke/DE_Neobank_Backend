{{ config(materialized='table') }}

SELECT
  country,
  MAX(city) as city  -- or MIN(city) depending on your preference
FROM
  `Silver_Tier.user_table`
GROUP BY
  country

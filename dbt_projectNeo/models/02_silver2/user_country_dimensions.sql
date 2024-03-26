{{ config(materialized='table') }}

SELECT
  country,
  MAX(city) as city  -- or MIN(city) depending on your preference
FROM
  `dbt_alexhalenke_silver_23032024.user_table`
GROUP BY
  country

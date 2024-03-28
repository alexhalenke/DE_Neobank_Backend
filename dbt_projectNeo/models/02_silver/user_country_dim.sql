{{ config(materialized='table') }}

SELECT
  country,
  MAX(city) as city  -- or MIN(city) depending on your preference
FROM
  {{ ref( 'users') }}
GROUP BY
  country

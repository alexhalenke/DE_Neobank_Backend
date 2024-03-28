{{ config(materialized='table') }}

select
  CAST(CONCAT(EXTRACT(YEAR FROM CAST(created_date AS DATE)),
  LPAD(CAST(EXTRACT(MONTH FROM CAST(created_date AS DATE)) AS STRING), 2, '0'),
  LPAD(CAST(EXTRACT(DAY FROM CAST(created_date AS DATE)) AS STRING), 2, '0')) AS INTEGER) AS date_ID,
  user_id,
  birth_year,
  country,
  city,
  user_settings_crypto_unlocked,
  date_time_with_timezone,
  plan,
  attributes_notifications_marketing_push,
  attributes_notifications_marketing_email,
  num_contacts,
  num_referrals,
  num_successful_referrals
from  {{ ref( 'users') }}

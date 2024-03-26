{{ config(materialized='table') }}
select
  cast(birth_year as integer) as birth_year,
  cast(country as varchar(10)) as country,
  --city,
  created_date,
  YEAR(created_date) * 10000 + MONTH(created_date) * 100 + DAY(created_date) as create_date_key
  user_settings_crypto_unlocked,
  plan,
  cast(attributes_notifications_marketing_push as bool) as marketing_push_notifications,
  cast(attributes_notifications_marketing_email as bool) as marketing_email_notifications,
  cast(num_contacts as int) as num_contacts,
  cast(num_referrals as int) as num_referrals,
  num_successful_referrals,
  cast(replace(user_id,'user_', '') as integer) as user_id


from {{ ref('src_bronzetiers') }}
where type ="users"

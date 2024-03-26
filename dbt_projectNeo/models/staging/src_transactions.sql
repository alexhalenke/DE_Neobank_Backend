{{ config(materialized='table') }}
select
  cast(replace(transaction_id,'transaction_', '') as int) as transaction_id
  transactions_type,
  cast(transactions_currency as varchar(10)) as transactions_currency,
  cast(amount_usd as float) as amount_usd,
  transactions_type,
  ea_cardholderpresence,
  ea_merchant_mcc,
 -- ea_merchant_city,
  ea_merchant_country,
  direction,
 cast(replace(user_id,'user_', '') as integer) as user_id
  YEAR(created_date) * 10000 + MONTH(created_date) * 100 + DAY(created_date) as create_date_key,
  created_date

from {{ ref('src_bronzetiers') }}
where type ="transactions"

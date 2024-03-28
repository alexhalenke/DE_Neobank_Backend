{{ config(materialized='table') }}


SELECT
  amount_usd,

  created_date,
  datime_with_timezone,
  direction,
  ea_cardholderpresence,
  ea_merchant_country,
  ea_merchant_mcc,
  transaction_id,
  transactions_currency,
  transactions_state,
  transactions_type,
  user_id


FROM  {{ ref( 'transactions') }}

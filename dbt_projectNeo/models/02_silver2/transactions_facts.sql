{{ config(materialized='table') }}


SELECT t.amount_usd,

t.created_date,
t.datime_with_timezone,
t.direction,
t.ea_cardholderpresence,
t.ea_merchant_country,
t.ea_merchant_mcc,
t.transaction_id,
t.transactions_currency,
t.transactions_state,
t.transactions_type,
t.user_id


 FROM `Silver_Tier.transaction_table`  as t

{{ config(materialized='table') }}

with merchant_data as (
  select
    concat(ea_merchant_country, ea_merchant_mcc) as merchant_id,
    ea_merchant_country as merchant_country,
    ea_merchant_mcc as merchant_categorization
from
  {{ref('transaction_table') }}
where
  (ea_merchant_mcc IS NOT NULL AND
  ea_merchant_country IS NOT NULL)
)

select
  distinct(merchant_id), merchant_country, merchant_categorization
from
  merchant_data
where
  (merchant_country IS NOT NULL AND
  merchant_categorization IS NOT NULL)

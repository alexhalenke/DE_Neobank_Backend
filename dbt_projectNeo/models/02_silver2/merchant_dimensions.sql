{{ config(materialized='table') }}

with merchant_data as (
  select
  concat(ea_merchant_country, ea_merchant_mcc) as merchant_id,
  ea_merchant_country as merchant_country,
  ea_merchant_mcc as merchant_categorization
from `Silver_Tier.transaction_table`)
select
  distinct(merchant_id), merchant_country, CAST(merchant_categorization AS INTEGER) as merchant_categorization
from
  merchant_data

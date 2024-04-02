
 -- total transactions over years by type of transaction

  SELECT

  sum(t.amount_usd) as total_amount,
  d.year,
  t.transactions_type,
  t.direction,
  d.month


 FROM  {{ ref('transactions_facts') }} as t
 left join  {{ ref('date_dim') }}  as d
 on CAST(FORMAT_DATE('%Y%m%d', cast(t.created_date as date)) AS INT64) = d.date_ID
 group by d.year,t.transactions_type

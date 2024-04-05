

 -- average moving transactions
 with agg_amount_by_month as (

SELECT

  sum(t.amount_usd) as total_amount,
  t.direction,
  d.year,
  d.month,
  t.transactions_state


 FROM {{ ref('transactions_facts') }} as t
 left join {{ ref( 'date_dim') }}  as d
 on CAST(FORMAT_DATE('%Y%m%d', cast(t.created_date as date)) AS INT64) = d.date_ID
 group by d.year, d.month, t.direction,  t.transactions_state


 )

select
  a.year,
  a.month,
  a.direction,
  a.transactions_state,
 AVG(total_amount) OVER (ORDER BY a.year,a.month ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_avg
 from agg_amount_by_month a

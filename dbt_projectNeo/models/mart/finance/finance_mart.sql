-- total transacations value by transaction  type


SELECT

 sum(t.amount_usd) as total_amount,
t.transactions_type

 FROM `sylvan-apogee-402010.Silver_Tier.transactions_facts`  as t
 group by t.transactions_type


 -- total transactions over years

 SELECT

  sum(t.amount_usd) as total_amount,
  d.year


 FROM `sylvan-apogee-402010.Silver_Tier.transactions_facts`  as t
 left join `sylvan-apogee-402010.Silver_Tier.date_dimensions`  as d
 on CAST(FORMAT_DATE('%Y%m%d', cast(t.created_date as date)) AS INT64) = d.date_ID
 group by d.year


 -- average moving transactions
 with agg_amount_by_month as (

SELECT

  sum(t.amount_usd) as total_amount,
  d.year,
  d.month


 FROM `sylvan-apogee-402010.Silver_Tier.transactions_facts`  as t
 left join `sylvan-apogee-402010.Silver_Tier.date_dimensions`  as d
 on CAST(FORMAT_DATE('%Y%m%d', cast(t.created_date as date)) AS INT64) = d.date_ID
 group by d.year, d.month


 )

select
  a.year,
  a.month,

 AVG(total_amount) OVER (ORDER BY a.year,a.month ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_avg
 from agg_amount_by_month a

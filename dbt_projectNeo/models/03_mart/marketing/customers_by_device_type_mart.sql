-- how many unique users we have by device type

SELECT

  count( distinct t.user_id) as total_customers,
  d.device_type

 FROM {{ ref( 'transactions_facts') }} as t

 INNER JOIN {{ ref( 'device_notification_dim') }} as d
 ON t.user_id = d.user_id
 group by d.device_type

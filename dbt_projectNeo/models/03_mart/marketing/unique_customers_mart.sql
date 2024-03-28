
 -- how many unique users  per channel , per notification reason

 SELECT

  count( distinct t.user_id) as total_customers,
  d.reason as notification_reason,
  d.channel

 FROM {{ ref( 'transactions_facts') }}  as t

 INNER JOIN  {{ ref( 'device_notification_dim') }}  as d
 ON t.user_id = d.user_id
 group by
 d.reason,
 d.channel

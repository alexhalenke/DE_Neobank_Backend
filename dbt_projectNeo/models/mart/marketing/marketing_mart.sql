-- how many unique users we have by device type

SELECT

  count( distinct t.user_id) as total_customers,
  d.device_type

 FROM `sylvan-apogee-402010.Silver_Tier.transactions_facts`  as t

 INNER JOIN `Silver_Tier.device_notification_dimensions` as d
 ON t.user_id = d.user_id
 group by d.device_type


 -- how many unique users  per channel , per notification reason

 SELECT

  count( distinct t.user_id) as total_customers,
  d.reason as notification_reason,
  d.channel

 FROM `sylvan-apogee-402010.Silver_Tier.transactions_facts`  as t

 INNER JOIN `Silver_Tier.device_notification_dimensions` as d
 ON t.user_id = d.user_id
 group by
 d.reason,
 d.channel

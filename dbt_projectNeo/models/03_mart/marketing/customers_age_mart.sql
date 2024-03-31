-- customer's age and average transaction amount
WITH cte_age as
(
SELECT
  EXTRACT(YEAR FROM CURRENT_DATE()) - birth_year AS age,
  user_id
FROM
  {{ ref('users_dim') }}


)
SELECT

  count( distinct t.user_id) as total_customers,
  avg(t.amount_usd) as average_amount_by_age,
  case
    when u.age between 0 and 15 then 'a. 0-15'
    when u.age between 16 and 24 then 'b. 16-24'
    when u.age between 25 and 34 then 'c. 25-34'
    when u.age between 35 and 44 then 'd. 35-44'
    when u.age between 45 and 54 then 'e. 45-54'
    when u.age between 55 and 64 then 'f. 55-64'
    when u.age between 65 and 74 then 'g. 65-74'
    when u.age between 75 and 84 then 'h. 75-84'
    when u.age >= 85 then 'i. 85+'
 else 'j. unknown'
 end as age_band

 FROM {{ ref( 'transactions_facts') }} as t
 LEFT JOIN  cte_age as u
 ON t.user_id = u.user_id
 group by age_band

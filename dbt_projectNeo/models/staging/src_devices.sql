{{ config(materialized='table') }}
select
 cast( string_field_0 as varchar(250)) as device_type
,   cast(replace(string_field_1,'user_', '') as integer) as user_id

from {{ ref('src_bronzetiers') }}
where type ="devices"

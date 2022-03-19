{{
  config(
    materialized='table'
  )
}}

select
    u.user_id,
    u.email,
    u.first_name,
    u.last_name,
    u.phone_number,
    u.created_at as user_created_at,
    u.updated_at as user_updated_at,
    a.address_id,
    a.address,
    a.zipcode,
    a.state,
    a.country
from
    {{ ref('stg_users') }} as u
join
    {{ ref('stg_addresses') }} as a
using
    (address_id)
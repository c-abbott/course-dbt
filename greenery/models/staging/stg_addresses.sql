{{
  config(
    materialized='table'
  )
}}

select
    address_id,
    address,
    zipcode,
    state,
    country
from
    {{ source('src_postgres', 'addresses') }}

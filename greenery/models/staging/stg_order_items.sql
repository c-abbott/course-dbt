{{
  config(
    materialized='table'
  )
}}

select
    order_id,
    product_id,
    quantity
from
    {{ source('src_postgres', 'order_items')}}
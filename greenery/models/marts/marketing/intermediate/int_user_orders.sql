{{
    config(
        materialized='table'
    )
}}

with users as (
    select * 
    from {{ ref('dim_users') }}
), 

orders as (
    select *
    from {{ ref('fct_orders') }}
)

select
  u.*,
  o.order_id,
  o.order_created_at::date as order_created_date,
  o.status,
  o.shipping_service,
  o.is_promo,
  o.promo_discount_rate,
  o.order_total, 
  o.days_to_deliver
from 
    users as u
join 
    orders as o
using
    (user_id)

{{
    config(
        materialized='table'
    )
}}

select
    o.order_id,
    o.user_id,
    o.promo_id,
    case 
        when o.promo_id is not null then true 
        else false 
    end as is_promo,
    (p.discount::float / 100) as promo_discount_rate,
    o.address_id,
    o.created_at as order_created_at,
    o.order_cost,
    o.shipping_cost,
    o.order_total,
    o.tracking_id,
    o.shipping_service,
    o.estimated_delivery_at,
    o.delivered_at as order_delivered_at,
    o.status
from
    {{ ref('stg_orders') }} as o
join
    {{ ref('stg_promos') }} as p
using
    (promo_id)
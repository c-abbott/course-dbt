{{
    config(
        materialized='table'
    )
}}

select 
    uo.user_id,
    uo.state,
    uo.order_id,
    uo.order_created_date,

    count(distinct(oi.quantity)) as number_of_items,
    sum(uo.order_total) as order_amount_usd
from
    {{ ref('int_user_orders') }} uo
join
    {{ ref('stg_order_items') }} as oi
using
    (order_id)
-- group by
    {{ dbt_utils.group_by(4) }}
order by
    order_created_date desc
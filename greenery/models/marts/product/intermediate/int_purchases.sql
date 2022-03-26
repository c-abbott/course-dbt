{{
    config(
        materialized='view'
    )
}}

with events as (
    select * from {{ ref('fct_events') }}
),

order_items as (
    select * from {{ ref('stg_order_items') }}
)

/*

    conversion rate := 
    # of unique sessions with a purchase event / total number of unique sessions

*/

select
    oi.product_id,
    cast(count(distinct e.session_id) as numeric) as total_purchases
from 
    events as e
left join 
    order_items as oi
using
    (order_id)
where 
    e.order_id is not null
group by 1
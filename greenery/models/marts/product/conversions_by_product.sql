{{
    config(
        materialized='table'
    )
}}

with events as (
    select * from {{ ref('fct_events') }}
),

order_items as (
    select * from {{ ref('stg_order_items') }}
),

products as (
    select * from {{ ref('dim_products') }}
),

purchases as (
    select * from {{ ref('int_purchases') }}
),

page_views as (
    select * from {{ref('int_page_views')}}
)

select 
    pv.product_id,
    pro.product_name,
    pv.page_views,
    p.total_purchases,
    round(p.total_purchases / pv.page_views, 4) as conversion_rate
from 
    page_views as pv
left join 
    purchases as p
using
    (product_id)
left join 
    products as pro 
using
    (product_id)
order by conversion_rate desc
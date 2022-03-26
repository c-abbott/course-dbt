with
user_sessions as (
    select * from {{ ref('fct_user_sessions') }}
),

sessions_w_purchase as (
    select * from {{ ref('int_sessions_w_purchase') }}
),

events as (
    select * from {{ ref('fct_events') }}
),

products as (
    select * from {{ ref('dim_products') }}
)

/*

    conversion rate by product := 
    # of unique sessions with a purchase event with a purchase event of that product 
    / # of unique sessions that viewed that product

*/

select
    e.product_id,
    p.product_name,

    count(distinct swp.session_id)::float / count(distinct us.session_id)::float as conversion_rate
from
    user_sessions as us
left join 
    sessions_w_purchase as swp
using 
    (session_id)
join
    events as e
on
    us.session_id = e.session_id
left join
    products as p
on 
    e.product_id = p.product_id
where
    us.page_view = 1
    and e.product_id is not null
group by 
    1, 2  
order by 
    conversion_rate desc
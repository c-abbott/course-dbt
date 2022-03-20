{{ 
    config(
        materialized='table'
    ) 
}}

with events as (
    select * from {{ ref('fct_events') }}
)

select
    session_id,
    event_created_at,
    user_id,

    /* 
        This could be a macro but I think the code is clearer it like this since you
        explicitly see the event types. Extra lines of SQL are cheap however human brain
        power is expensive
    */
    sum(case when event_type='page_view' then 1 else 0 end) as page_view,
    sum(case when event_type='add_to_cart' then 1 else 0 end) as add_to_cart,
    sum(case when event_type='checkout' then 1 else 0 end) as checkout,
    sum(case when event_type='package_shipped' then 1 else 0 end) as package_shipped
from
    events

{{ dbt_utils.group_by(3) }}
{{
    config(
        materialized='view'
    )
}}

select 
    product_id,
    count(distinct session_id)::numeric as page_views
from 
    events
where 
    event_type = 'page_view'
group by 1
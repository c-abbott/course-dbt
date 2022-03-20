{{
    config(
        materialized='table'
    )
}}

select
    session_id,
    min(event_created_at) as first_event,
    max(event_created_at) as last_event
from 
    {{ ref('fct_events')}}
group by 
    session_id
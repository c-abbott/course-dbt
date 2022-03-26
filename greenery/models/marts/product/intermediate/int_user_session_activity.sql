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
    product_id,
    event_created_at,
    user_id,
    {{ agg_by_col('events', 'event_type') }}
from
    events
{{ dbt_utils.group_by(4) }}
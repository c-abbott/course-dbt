{{
    config(
        materialized='table'
    )
}}

select
    e.event_id,
    e.session_id,
    e.user_id,
    e.page_url,
    e.created_at as event_created_at,
    e.event_type,
    e.order_id,
    e.product_id
from
    {{ ref('stg_events') }} as e
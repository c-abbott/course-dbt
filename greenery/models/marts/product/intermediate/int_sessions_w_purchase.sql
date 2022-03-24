{{
    config(
        materialized='view'
    )
}}

/*

    conversion rate := 
    # of unique sessions with a purchase event / total number of unique sessions

*/

select
    us.session_id,
    us.session_length_minutes
from
    {{ ref('fct_user_sessions')}} as us
where
    checkout = 1 -- purchase and checkout are equivalent events
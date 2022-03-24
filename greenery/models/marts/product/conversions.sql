with
user_sessions as (
    select * from {{ ref('fct_user_sessions') }}
),

sessions_w_purchase as (
    select * from {{ ref('int_sessions_w_purchase') }}
)

/*

    conversion rate := 
    # of unique sessions with a purchase event / total number of unique sessions

*/

select
    count(distinct swp.session_id)::float / count(distinct us.session_id)::float as conversion_rate
from
    user_sessions as us
left join
    sessions_w_purchase as swp
using
    (session_id)




/* 
   
    conversion rate by product := 
    of unique sessions with a purchase event of that product / total number of unique sessions that viewed that product 

*/
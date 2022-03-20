{{ 
    config(
        materialized='table'
    ) 
}}

with 

users as (
    select * from {{ ref('dim_users')}}
),

session_lengths as (
    select * from {{ ref('int_session_length')}}
),

user_session_activity as (
    select * from {{ ref('int_user_session_activity')}}
)


select
    usa.session_id,
    usa.user_id,
    u.first_name,
    u.last_name,
    u.email,
    u.state,
    u.country,
    usa.page_view,
    usa.add_to_cart,
    usa.checkout,
    usa.package_shipped,
    extract(epoch from (sl.last_event::timestamp - sl.first_event::timestamp)) / 60 as session_length_minutes
from
    user_session_activity as usa
left join 
    users as u 
using 
    (user_id)
left join 
    session_lengths as sl 
using 
    (session_id)

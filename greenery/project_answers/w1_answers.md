# Week 1 Questions

### Q1: How many users do we have?

- Answer: 130 users.

```
select count(distinct user_id) from dbt.dbt_callum_a.stg_users
```

### Q2: On average, how many orders do we receive per hour?

- Answer: we average 7.52 orders per hour.

```
with orders_per_hour as (
  select 
    date_trunc('hour', created_at) as created_at_hour,
    count(order_id) as orders
  from dbt.dbt_callum_a.stg_orders
  group by 1
)

select avg(orders) as avg_orders_per_hour from orders_per_hour
```

### Q3: On average, how long does an order take from being placed to being delivered?

- Answer: on average, we deliver in just under 4 days, specifically, 3 days 21 hours 21 minutes and 11 seconds (3 days 21:24:11).

```
with delivery_times as (
    select (delivered_at - created_at) as delivery_time
    from dbt.dbt_callum_a.stg_orders
)

select avg(delivery_time) as avg_delivery_time from delivery_times
```


### Q4: How many users have only made one purchase? Two purchases? Three+ purchases?

Note: you should consider a purchase to be a single order. In other words, if a user places one order for 3 products, they are considered to have made 1 purchase.

| orders      | Description |
| ----------- | ----------- |
| 1           | 25          |
| 2           | 28          |
| 3+          | 71         |

```
with orders_per_user as (
  select
    user_id,
    count(distinct order_id) as orders
  from dbt.dbt_callum_a.stg_orders
  group by 1
)

select
  case 
    when orders >= 3 then '3+'
    else orders::varchar
  end as orders_placed,
  count(distinct user_id) users
from orders_per_user
group by 1
order by orders_placed
```


### Q5: On average, how many unique sessions do we have per hour?

- Answer: we have 16.33 unique sessions per hour

```
with sessions_per_hour as(
  select 
    date_trunc('hour', created_at) sessions_hour,
    count(distinct session_id) as sessions
  from dbt.dbt_callum_a.stg_events
  group by 1
)

select avg(sessions) as avg_sessions_per_hour from sessions_per_hour
```

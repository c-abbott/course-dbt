# Week 2 Questions

### Q2: What is our user repeat rate?
Repeat Rate = Users who purchased 2 or more times / users who purchased

- Answer: 79.8%

```sql
with count_orders_by_user as (
    select
        user_id,
        count(*) as orders_placed
    from
        dbt_callum_a.stg_orders 
    group by 1
    order by orders_placed desc
),

repeaters as (
    select
        user_id,
        case
            when orders_placed >= 2 then 1
            when orders_placed < 2 then 0 
            else null
        end as is_repeater
)

select
    sum(is_repeater)::float / count(*)::float as repeat_rate
from repeaters
```

### Q2: What are good indicators of a user who will likely purchase again? What about indicators of users who are likely NOT to purchase again? If you had more data, what features would you want to look into to answer this question?

NOTE: This is a hypothetical question vs. something we can analyze in our Greenery data set. Think about what exploratory analysis you would do to approach this question.

**Good indicators of whether the user is likely to purchase again:**
- Did they use a promo code?
- How many orders have they made in total?
- What is the median/average number of items in their order?
- What is the frequency of their orders? i.e. median/average time between orders
- Did the order arrive *earlier* than they expected? 
- What time of year was the order made (seasonality)? Are plants more commonly bought in warmer months?
- Address of user
- Events of the website i.e. what events correlate with the purchase event

**Bad indicators of whether the user is likely to purchase again:**
- The converse of the answers above kinda hit two birds with one stone i.e. if an order arrives *later* than expected, or if the user has made few, infrequent orders

**If only I had more data...**
- I'd like to look at some kind of customer survey, something something NPS score
- Information on which plants (products) thrive in what environments  (locations). This would allow us to promote certain plant species dependent on your location/address. For example, *purchase this <species_of_plant>, they do great in <location> this time of year!*

### Q3: Explain the marts models you added. Why did you organize the models in the way you did?

**Core**

This was the easiest mart to create since it is fundamental to any business to track the main components of their business process, and in Greenery's case this would be:
- What are our products? (`dim_products`)
- Who is or has been buying or products? (`dim_users`)
- When did they buy those products? (`dim_events`)
- How are we delivering that product? (`dim_orders`)

**Marketing**

For marketing, I focussed on building a model which informs them on the number of items in that order as well as the total amount of that order in USD. I specifially added the `user.state` dimension so the team could slice the data by this dimension enabling them to discover which geographies are performing best. They could then run campaigns to tackle the low performing regions or double down in the high performing regions -- the better strategy is unknown and debatable but nevertheless the information is useful.

**Product**

Finally, for product I focussed on a model which encapsulates the user's activity on the Greenery website. The insights provided by this model would enable the product team to optimize areas of the site which user's find difficult to navigate i.e. by looking at the average times between page_view, add_to_cart, checkout etc.


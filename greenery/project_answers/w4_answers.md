# Week 4 Questions
### Q1: dbt Snapshot
The snapshot was successfully implemented in the `snapshots` folder but I can't provide evidence since...
1. I originally applied the snapshot to my `fct_orders` table
2. Then I ran the update script which update the rows of the `src_postgres.orders` table NOT the `fct_orders` table
3. I then realized my mistake and changed my snapshot back to `src_postgres.orders` but it's too late since I already ran the update script!

### Q2: Product Funnel
|funnel_level_label  |funnel_level_id|num_sessions|num_sessions_level_above|level_conversion|drop_off_relative|drop_off_absolute|
|--------------------|---------------|------------|------------------------|----------------|-----------------|-----------------|
|at_least_page_view  |1              |578         |                        |                |                 |                 |
|at_least_add_to_cart|2              |467         |578                     |0.81            |0.19             |0.19             |
|at_least_checkout   |3              |361         |467                     |0.77            |0.04             |0.23             |


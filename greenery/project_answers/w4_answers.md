# Week 4 Questions
### Part 1: dbt Snapshot
The snapshot was successfully implemented in the `snapshots` folder but I can't provide evidence since...
1. I originally applied the snapshot to my `fct_orders` table
2. Then I ran the update script which update the rows of the `src_postgres.orders` table NOT the `fct_orders` table
3. I then realized my mistake and changed my snapshot back to `src_postgres.orders` but it's too late since I already ran the update script!

### Part 2: Product Funnel
|funnel_level_label  |funnel_level_id|num_sessions|num_sessions_level_above|level_conversion|drop_off_relative|drop_off_absolute|
|--------------------|---------------|------------|------------------------|----------------|-----------------|-----------------|
|at_least_page_view  |1              |578         |                        |                |                 |                 |
|at_least_add_to_cart|2              |467         |578                     |0.81            |0.19             |0.19             |
|at_least_checkout   |3              |361         |467                     |0.77            |0.04             |0.23             |

### Part 3: Reflection questions -- please answer 3A or 3B, or both!

*if your organization is thinking about using dbt, how would you pitch the value of dbt/analytics engineering to a decision maker at your organization?*

I think dbt has many strengths but I believe its strongest selling point lies in it's software engineering approach to analytics. Robust, maintainable and scalable data pipelines are the core part of a successful analytics team and dbt enables this with features such as:
1. Implicitly being able to define a DAG using {{ ref() }} functions
2. Built-in model testing
3. Built-in documentation
4. Version Control and CI/CD

*if your organization is using dbt, what are 1-2 things you might do differently / recommend to your organization based on learning from this course?*

N/A

if you are thinking about moving to analytics engineering, what skills have you picked that give you the most confidence in pursuing this next step?

I'm happy as a Data Scientist so I won't be switching to a purely Analytics Engineering role anytime soon, but I definitley will be doing more of it in the future! I subscribe to the philosophy that we should strive to be "full-stack" Data Scientists -- able to serve ourselves across the data stack whether that be data engineering, modelling, analytics, etc, etc.

This course has taught me a lot about the practicalities of dbt and I now have a lot of confidence in spinning up dbt models quickly to serve stakeholders in my organisation. I like how intuitive and flexible dbt is in the way it does not try solve the problem of creating a monolith industry data warehouse from the get go. Instead, you add complexity to your models over time until eventually you have created this very thing and along the way you have added docs and tests -- it's fantastic!

*And finally, before you fly free into the dbt night, we will take a step back and reflect: after learning about the various options for dbt deployment and seeing your final dbt project, how would you go about setting up a production/scheduled dbt run of your project in an ideal state?*

To begin with, I would follow something along the lines of this [blogpost](https://www.astronomer.io/blog/airflow-dbt-1/) from astronomer where they recreate all their dbt models in Airflow by parsing the `manifest.json`. They then orchestrate these models by invoking `BashOperators` which simply run each individual model sequentially giving you fine-grained access to the DAG.
# Week 3 Questions

### Q1a: What is our overall conversion rate?

```sql
with sessions as (
  select
    sum(case when checkout = 1 then 1 else 0 end) as purchase_sessions,
    count(distinct session_id) as total_sessions
  from
    dbt_callum_a.fct_user_sessions
)

select
  round(purchase_sessions::numeric / total_sessions::numeric, 4) as conversion_rate
from
  sessions
```

- Answer: 62.5%


### Q1b: What is our conversion rate by product?

```sql
    select * from dbt_callum_a.conversions_by_product
```

|product_id                          |product_name       |page_views|total_purchases|conversion_rate|
|------------------------------------|-------------------|----------|---------------|---------------|
|fb0e8be7-5ac4-4a76-a1fa-2cc4bf0b2d80|String of pearls   |64        |39             |0.6094         |
|74aeb414-e3dd-4e8a-beef-0fa45225214d|Arrow Head         |63        |35             |0.5556         |
|c17e63f7-0d28-4a95-8248-b01ea354840e|Cactus             |55        |30             |0.5455         |
|b66a7143-c18a-43bb-b5dc-06bb5d1d3160|ZZ Plant           |63        |34             |0.5397         |
|689fb64e-a4a2-45c5-b9f2-480c2155624d|Bamboo             |67        |36             |0.5373         |
|579f4cd0-1f45-49d2-af55-9ab2b72c3b35|Rubber Plant       |54        |28             |0.5185         |
|be49171b-9f72-4fc9-bf7a-9a52e259836b|Monstera           |49        |25             |0.5102         |
|b86ae24b-6f59-47e8-8adc-b17d88cbd367|Calathea Makoyana  |53        |27             |0.5094         |
|e706ab70-b396-4d30-a6b2-a1ccf3625b52|Fiddle Leaf Fig    |56        |28             |0.5000         |
|5ceddd13-cf00-481f-9285-8340ab95d06d|Majesty Palm       |67        |33             |0.4925         |
|615695d3-8ffd-4850-bcf7-944cf6d3685b|Aloe Vera          |65        |32             |0.4923         |
|35550082-a52d-4301-8f06-05b30f6f3616|Devil's Ivy        |45        |22             |0.4889         |
|55c6a062-5f4a-4a8b-a8e5-05ea5e6715a3|Philodendron       |62        |30             |0.4839         |
|a88a23ef-679c-4743-b151-dc7722040d8c|Jade Plant         |46        |22             |0.4783         |
|64d39754-03e4-4fa0-b1ea-5f4293315f67|Spider Plant       |59        |28             |0.4746         |
|5b50b820-1d0a-4231-9422-75e7f6b0cecf|Pilea Peperomioides|59        |28             |0.4746         |
|37e0062f-bd15-4c3e-b272-558a86d90598|Dragon Tree        |62        |29             |0.4677         |
|d3e228db-8ca5-42ad-bb0a-2148e876cc59|Money Tree         |56        |26             |0.4643         |
|c7050c3b-a898-424d-8d98-ab0aaad7bef4|Orchid             |75        |34             |0.4533         |
|05df0866-1a66-41d8-9ed7-e2bbcddd6a3d|Bird of Paradise   |60        |27             |0.4500         |
|843b6553-dc6a-4fc4-bceb-02cd39af0168|Ficus              |68        |29             |0.4265         |
|bb19d194-e1bd-4358-819e-cd1f1b401c0c|Birds Nest Fern    |78        |33             |0.4231         |
|80eda933-749d-4fc6-91d5-613d29eb126f|Pink Anthurium     |74        |31             |0.4189         |
|e2e78dfc-f25c-4fec-a002-8e280d61a2f2|Boston Fern        |63        |26             |0.4127         |
|6f3a3072-a24d-4d11-9cef-25b0b5f8a4af|Alocasia Polly     |51        |21             |0.4118         |
|e5ee99b6-519f-4218-8b41-62f48f59f700|Peace Lily         |66        |27             |0.4091         |
|e18f33a6-b89a-4fbc-82ad-ccba5bb261cc|Ponytail Palm      |70        |28             |0.4000         |
|e8b6528e-a830-4d03-a027-473b411c7f02|Snake Plant        |73        |29             |0.3973         |
|58b575f2-2192-4a53-9d21-df9a0c14fc25|Angel Wings Begonia|61        |24             |0.3934         |
|4cda01b9-62e2-46c5-830f-b7f262a58fb1|Pothos             |61        |21             |0.3443         |

### Q2: Create a macro to simplify part of a model(s).

The macro I created can be found in the `macros` folder under the name `agg_by_col.sql` which aggregates for each distinct value in a specified column. I use this in the `int_user_session_activity` model to aggregate by session events. I also created a macro in the macros folder called `grant_role.sql` that I used to call in the post hooks to grant acess to reporting.


### Q3: Add a post hook to your project to apply grants to the role “reporting”.

See `dbt_project.yml` file.

### Q4: Install a package (i.e. dbt-utils, dbt-expectations) and apply one or more of the macros to your project.

I was fairly light on this. I mainly used the `dbt-utils.group_by` functionality where I thought was appropriate. I'll most likely tryout `codegen` next week,

### Q5: Show (using dbt docs and the model DAGs) how you have simplified or improved a DAG using macros and/or dbt packages.

See slack



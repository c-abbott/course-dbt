{% snapshot snap_order_status %}

  {{
    config(
      target_schema='dbt_callum_a',
      unique_key='order_id',
      strategy='check',
      check_cols=['status', 'promo_discount_rate'],
    )
  }}

  select * from {{ source('src_postgres', 'orders') }}

{% endsnapshot %}
{% snapshot snap_order_status %}

  {{
    config(
      target_schema='snapshots',
      unique_key='order_id',
      strategy='check',
      check_cols=['status', 'promo_discount_rate'],
    )
  }}

  select * from {{ ref('fct_orders') }}

{% endsnapshot %}
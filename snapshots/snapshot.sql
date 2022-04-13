{% begin snapshot_fact_orders %}
{{
    config(
      unique_key='sales_id',
      --target_schema = 'analytics',
      strategy='check',
      check_cols=[
        'order_id',
        'customer_id',
        'order_date',
        'status',
        'amount'
      ]
    )
}}

select * from {{ ref('fact_orders') }}

{% end snapshot_fact_orders %}
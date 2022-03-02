{% begin snapshot_table %}
{{
    config(
      unique_key='sales_id',
      target_schema = 'analytics',
      strategy='check',
      check_cols=[
        'customer_standard_leadtime',
        'global_order_promise_leadtime',
        'actual_supply_leadtime',
        'customer_standard_leadtime_unit',
        'global_order_promise_leadtime_unit',
        'actual_supply_leadtime_unit',
        'atp_rule_name'
      ]
    )
}}

select * from {{ ref('stg_table') }}

{% end snapshot_table %}
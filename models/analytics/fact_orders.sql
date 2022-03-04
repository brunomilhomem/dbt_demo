{{ config(schema= 'analytics') }}

with fact_orders as (

    select * from {{ ref('stg_orders') }}

),

order_payments as (

    select * from {{ ref('stg_payments') }}

),

final as (

    select
        fact_orders.order_id,
        fact_orders.customer_id,
        fact_orders.order_date,
        fact_orders.status,
        order_payments.total_amount as amount

    from fact_orders

    left join order_payments using (order_id)

)

select * from final
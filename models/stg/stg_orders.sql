{{ config(schema: 'stg') }}

with orders as (

    select
        {{ dbt_utils.surrogate_key(['id']) }} as sk_order
        ,id as order_id
        ,user_id as customer_id
        ,order_date
        ,status
        ,min(order_date) as first_order
        ,max(order_date) as most_recent_order
        ,count(order_id) as number_of_orders

    from {{ ref('orders')}} orders

    group by order_id, customer_id, order_date, status

)

select * from orders
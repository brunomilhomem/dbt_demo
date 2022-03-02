with fact_orders as (

    select
        orders.order_id
        ,orders.customer_id
        ,orders.order_date
        ,orders.status
        --metrics
        ,orders.first_order
        ,orders.most_recent_order
        ,orders.number_of_orders
        ,order_payments.total_amount as amount
        
    from {{ ref('stg_orders')}} orders
    left join {{ ref('stg_payments')}} payments using (order_id)

)

select * from fact_orders
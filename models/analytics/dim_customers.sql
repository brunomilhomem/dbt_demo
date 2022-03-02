with customer as (

    select
        customers.
        ,customer_orders.
        ,customer_payments.

    from {{ ref('stg_customers')}} customers
    left join {{ ref('stg_orders')}} customer_orders using (customer_id)
    left join {{ ref ('stg_payments')}} customer_payments using (customer_id)
)

select * from customer
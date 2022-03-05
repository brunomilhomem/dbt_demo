with payments as (

    select
        {{ dbt_utils.surrogate_key(['id']) }} as sk_payment
        ,id as payment_id
        ,orders.customer_id
        ,order_id
        ,payment_method

        --amount is currently stored in cents, so we convert it into dollars
        ,amount / 100 as amount
        ,sum(amount) as total_amount

    from {{ ref('raw_payments')}} payments
    left join {{ ref('stg_orders')}} orders using (order_id)

    group by sk_payment, payment_id, customer_id, order_id, payment_method, amount

)

select * from payments
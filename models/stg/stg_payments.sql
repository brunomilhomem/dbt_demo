with payments as (

    select
        {{ dbt_utils.surrogate_key(['id']) }} as sk_payment
        ,payments.id as payment_id
        ,payments.payment_method
        ,stg_orders.order_id
        --amount is currently stored in cents, so we convert it into dollars
        ,payments.amount / 100 as amount

    from {{ ref('raw_payments')}} payments

    left join {{ ref('stg_orders') }} stg_orders using (order_id)

    group by payment_id
        ,stg_orders.order_id
        ,payments.payment_method
        ,payments.amount

)

select * from payments
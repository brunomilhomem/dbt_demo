with payments as (

    select
        {{ dbt_utils.surrogate_key(['id', 'order_id', 'payment_method']) }} as payment_id
        ,order_id
        ,payment_method

        --amount is currently stored in cents, so we convert it into dollars
        ,amount / 100 as amount
        ,sum(amount) as total_amount

    from {{ ref('payments')}} payments

    group by payment_id, order_id, payment_method

)

select * from payments
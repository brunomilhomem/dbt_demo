with raw_payments as (

    select * from {{ source('raw_data', 'payments')}}

),

final as (

    select * from raw_payments

)

select * from final
with raw_orders as (

    select * from {{ source('raw_data', 'orders')}}

),

final as (

    select * from raw_orders
)

select * from final
{{ config(schema= 'raw') }}

with raw_customers as (

    select * from {{ source('raw_data', 'customers')}}

),

final as (

    select * from raw_customers
)

select * from final
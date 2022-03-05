with customer as (

select
    {{ dbt_utils.surrogate_key(['id']) }} as sk_customer
    ,id as customer_id
    ,first_name
    ,last_name
    ,email

from {{ ref ('customers')}} customers

)

select * from customer
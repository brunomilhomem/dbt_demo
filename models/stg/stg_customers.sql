{{ config(materialized='view') }}

with customer as (

select
    {{ dbt_utils.surrogate_key(['id', 'fist_name', 'last_name']) }} as customer_id
    ,first_name
    ,last_name
    ,email

from {{ ref ('customers')}} customers

)

select * from customer
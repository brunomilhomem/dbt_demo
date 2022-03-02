{{ config(materialized='table') }}

with source_data as (

select
    sales_id
    ,sales_date
    ,sales_time
    ,branch
    ,city
    ,customer_type
    ,gender
    ,product_line
    ,payment

from {{ ref ('stg_supermarket_sales')}}

)

select * from source_data
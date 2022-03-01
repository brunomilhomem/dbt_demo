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

    --metrics
    ,unit_price
    ,quantity
    ,tax_five_percent
    ,total_sales
    ,cost_of_goods_sold
    ,gross_margin_percentage
    ,gross_income
    ,rating

from {{ ref ('stg_supermarket_sales')}}


)

select * from source_data
{{ config(materialized='view') }}

with source_data as (

select
    {{ dbt_utils.surrogate_key(['branch', 'city', 'customer_type']) }} as sales_id
    ,date as sales_date
    ,time as sales_time
    ,branch
    ,city
    ,customer_type
    ,gender
    ,product_line
    ,payment

    --metrics
    ,unit_price
    ,quantity
    ,tax as tax_five_percent
    ,total as total_sales
    ,cogs as cost_of_goods_sold
    ,gross_margin_percentage
    ,gross_income
    ,rating

from {{ ref ('raw_supermarket_sales')}}


)

select * from source_data
{{ config(materialized='incremental') }}

with source_data as (

select
    sales_id
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
{{
  config(
    tags=['product_ops']
  )
}}

with validation as (
    select *
    from analytics.edw.dim_product
    where item_number in (
                          select item_number
                          from {{ref('dim_product')}}
                          where source_name = 'CALIX'
                          )
    and nvl(source_name,'NULL') <> 'CALIX' 
)

select * from validation
with assert_that_dim_customers_does_not_have_duplicates as (

  select 
      customer_id
      ,first_order
      ,most_recent_order
      ,number_of_orders
      ,count(*) 

  from {{ ref('dim_customer') }}

  group by 
      customer_id
      ,first_order
      ,most_recent_order
      ,number_of_orders

  having count(*) > 1
      
)

select * from assert_that_dim_customers_does_not_have_duplicates
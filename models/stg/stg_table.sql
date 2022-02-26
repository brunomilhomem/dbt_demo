{{ config(materialized='table') }}

with source_data as (

select
    {{ dbt_utils.surrogate_key(['file_name','tracking','line']) }} as freight_ups_id
    to_date(_fivetran_synced) as creation_date,
    to_number(to_char(file_date,'yyyymmdd')) as file_date_id,
    to_number(to_char(creation_date,'yyyymmdd')) as creation_date_id
from {{ source ('warehouse', 'supermarket_sales')}}


)

select * from source_data
select *
from {{ ref('stg_supermarket_sales') }}
where id = 1

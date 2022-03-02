select * 
from {{ source('raw', 'payments')}}
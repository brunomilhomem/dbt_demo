select * 
from {{ source('raw', 'customers')}}
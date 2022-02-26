{{
  config(
    unique_key = 'supplier_id',
  )
}}

select
  to_char(vend_calor_030.supplier_id) as supplier_id,
  to_char(vend_calor_030.supplier_number) as supplier_number,
  vend_calor_030.file_name,
  vend_calor_030.supplier_name,
  account.account_sub_type,
  upper(vend_calor_030.manufacturing_location) as manufacturing_location,
  vend_calor_030.last_update_date,
  vend_calor_030.last_update_date_id,
  vend_calor_030.file_date,
  vend_calor_030.file_date_id,
  'N' as is_propel
from {{ ref('stg_vend_calor_030') }} vend_calor_030
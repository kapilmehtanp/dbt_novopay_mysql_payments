
-- Use the `ref` function to select from other models

select *
from {{ ref('transaction_audit_model') }}

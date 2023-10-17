select distinct
row_number() over (order by 1) as fake_id
,parse_json(dishes_names)::array as dishes_names
, payment_method
,amount
,created_at
from {{ref('base_fuzzy_orders')}}
{{
  config(
    materialized = "table",
  )
}}


select
    b.fake_id
    , n.value as dish_user_input
    , payment_method
    , amount
    , created_at
from
{{ref('fuzzy_dishes_fake_id')}} as b
, lateral flatten(input => b.dishes_names) as n
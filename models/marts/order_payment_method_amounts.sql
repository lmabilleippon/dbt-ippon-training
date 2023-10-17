
{% set payment_methods = dbt_utils.get_column_values(table=ref('stg_jointure_restaurants_order'), column='payment_method') %}

select
    IDENTIFIER,
    NAME,
    {% for payment_method in payment_methods %}
    sum(case when payment_method = '{{payment_method}}' then amount end) as {{payment_method}}_amount,
    {% endfor %}
    sum(amount) as total_amount
from  {{ref('stg_jointure_restaurants_order')}}
group by IDENTIFIER, NAME
with jointure_1 as (
    select 
    RESTAURANT_IDENTIFIER as RESTAURANT_IDENTIFIER,
    amount as amount,
    name as name
    from {{ref('base_orders')}} as orders 
    inner join {{ref('base_restaurants')}} as restaurants
    on orders.RESTAURANT_IDENTIFIER = restaurants.IDENTIFIER
    )
select name, sum(amount) as amount, RESTAURANT_IDENTIFIER
from jointure_1
group by RESTAURANT_IDENTIFIER, name

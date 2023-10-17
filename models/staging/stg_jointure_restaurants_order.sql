{{
  config(
    materialized = "table",
  )
}}

select orders.identifier as orders_id, restaurants.IDENTIFIER, orders.amount, restaurants.name, orders.payment_method
from {{ref('base_orders')}} as orders 
inner join {{ref('base_restaurants')}} as restaurants
on orders.RESTAURANT_IDENTIFIER = restaurants.IDENTIFIER


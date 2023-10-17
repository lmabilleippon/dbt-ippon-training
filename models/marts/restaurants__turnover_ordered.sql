select 
RANK() OVER(ORDER BY amount DESC) as classement, name, amount
from {{ref('stg_restaurants__turnover')}}
LIMIT {{ var('nb_restaurants_to_show') }}
select count(*) from {{ref('stg_flatten_cleaned_names')}}
where dish_name = 'Pinte de Biere' and date(created_at) = '2022-08-01'

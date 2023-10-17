{{
  config(
    materialized = "table",
  )
}}

select * from {{ source('norbert', 'DISHES') }}
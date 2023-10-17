select sum(NB_EMPLOYEES) count_employees from {{ source('norbert', 'restaurants') }}


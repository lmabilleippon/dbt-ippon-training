{% macro mockable_source(source_name, table, sample_table) %}
    ({%if target.name == "ci" %}
    {{ ref(sample_table)}}
    {% else %}
    {{source(source_name, table)}}
 {% endif %} )
{% endmacro %}
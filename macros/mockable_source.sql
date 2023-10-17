{% macro mockable_source(source_name, table, sample) %}
    ({%if target.name == "ci" %}
    {{ ref(sample)}}
    {% else %}
    {{source(source_name, table)}}
 {% endif %} )
{% endmacro %}
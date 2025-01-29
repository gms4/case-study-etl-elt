{% macro lower_and_underscore_all_columns() %}
    {%- set columns = dbt_utils.get_filtered_columns_in_relation(this) -%}
    {%- for column in columns %}
        {{ column.name | lower | replace(' ', '_') }} AS {{ column.name | lower | replace(' ', '_') }}{% if not loop.last %},{% endif %}
    {%- endfor %}
{% endmacro %}
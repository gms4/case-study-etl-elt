{% macro clean_column_value(column) %}
    {{ column | replace("\r", "") | replace("\n", "") }}
{% endmacro %}

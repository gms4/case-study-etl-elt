{% macro remove_newlines(column_name) %}
    TRIM(REGEXP_REPLACE({{ column_name }}, '\\n', '', 'g'))
{% endmacro %}
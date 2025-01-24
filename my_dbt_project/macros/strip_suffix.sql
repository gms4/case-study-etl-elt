{% macro strip_suffix(column, suffix) %}
    regexp_replace({{ column }}, '{{ suffix }}$', '')
{% endmacro %}

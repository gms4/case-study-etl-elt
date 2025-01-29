{% macro strip_affix(column, affix) %}
    CASE
        WHEN {{ column }} IS NOT NULL THEN
            regexp_replace({{ column }}, '^{{ affix }}|{{ affix }}$', '')
        ELSE
            NULL
    END
{% endmacro %}
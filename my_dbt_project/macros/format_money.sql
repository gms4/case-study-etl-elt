{% macro format_money(column) %}
CASE
    -- Remove "€" primeiro
    WHEN {{ column }} LIKE '€%M' THEN 
        CAST({{ strip_affix(strip_affix(column, '€'), 'M') }} AS FLOAT) * 1000000
    WHEN {{ column }} LIKE '€%K' THEN 
        CAST({{ strip_affix(strip_affix(column, '€'), 'K') }} AS FLOAT) * 1000
    ELSE 
        CAST({{ strip_affix(column, '€') }} AS FLOAT)
END
{% endmacro %}

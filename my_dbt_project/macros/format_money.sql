{% macro format_money(column) %}
CASE
    -- When the value contains "€" and "M" (millions)
    WHEN {{ column }} LIKE '€%M' THEN
        CAST(
            CAST(REPLACE(REPLACE({{ column }}, '€', ''), 'M', '') AS FLOAT) * 1000000
            AS INT
        )
    -- When the value contains "€" and "K" (thousands)
    WHEN {{ column }} LIKE '€%K' THEN
        CAST(
            CAST(REPLACE(REPLACE({{ column }}, '€', ''), 'K', '') AS FLOAT) * 1000
            AS INT
        )
    -- When the value contains only "€" (simple number in euros)
    WHEN {{ column }} LIKE '€%' THEN
        CAST(REPLACE({{ column }}, '€', '') AS INT)
    -- When the value contains "M" without "€"
    WHEN {{ column }} LIKE '%M' THEN
        CAST(
            CAST(REPLACE({{ column }}, 'M', '') AS FLOAT) * 1000000
            AS INT
        )
    -- When the value contains "K" without "€"
    WHEN {{ column }} LIKE '%K' THEN
        CAST(
            CAST(REPLACE({{ column }}, 'K', '') AS FLOAT) * 1000
            AS INT
        )
    -- Otherwise, assume it's a simple number
    ELSE
        CAST({{ column }} AS INT)
END
{% endmacro %}

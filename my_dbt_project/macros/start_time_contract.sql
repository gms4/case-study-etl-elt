{% macro start_time_contract(column) %}
CASE
    -- Quando o valor contém "~", retorna os primeiros 4 caracteres como ano
    WHEN {{ column }} LIKE '%~%' THEN 
        CAST(SUBSTRING({{ column }}, 1, 4) AS TEXT)

    -- Quando o valor contém "Loan", remove " On Loan" e extrai o ano da data
    WHEN {{ column }} LIKE '%Loan%' THEN
        CAST(
            EXTRACT(YEAR FROM TO_DATE(REPLACE({{ column }}, ' On Loan', ''), 'Mon DD, YYYY'))
            AS TEXT
        )

    -- Quando o valor contém "Free", retorna "No Club"
    WHEN {{ column }} LIKE '%Free%' THEN
        'No Club'

    -- Caso contrário, retorna NULL
    ELSE NULL
END
{% endmacro %}

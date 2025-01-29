{% macro ft_to_cm(column) %}
    CASE
        WHEN {{ column }} LIKE '%''%' THEN
            -- Se contiver pés (apóstrofe)
            CAST(
                (
                    -- Remove "cm" do valor (se presente) e converte pés para centímetros
                    (CAST(SPLIT_PART({{ strip_affix(column, 'cm') }}, '''', 1) AS FLOAT) * 30.48) +
                    -- Converte polegadas para centímetros (parte após o apóstrofe)
                    (CAST(REPLACE(SPLIT_PART({{ strip_affix(column, 'cm') }}, '''', 2), '"', '') AS FLOAT) * 2.54)
                ) AS NUMERIC
            )::INT  -- Converte para INT após a soma, sem usar ROUND diretamente
        ELSE
            -- Caso o valor seja em centímetros
            CAST({{ column }} AS INT)
    END
{% endmacro %}
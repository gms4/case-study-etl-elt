{% macro lbs_to_kg(column) %}
    CASE
        WHEN {{ column }} LIKE '%lbs%' THEN
            -- Se contiver "lbs"
            CAST(
                (
                    -- Remove "lbs" do valor e converte de libras para quilos
                    (CAST({{ strip_suffix(column, 'lbs') }} AS FLOAT) / 2.2)
                ) AS NUMERIC
            )::INT  -- Converte para INT após a divisão
        ELSE
            -- Caso o valor já esteja em quilos
            CAST({{ column }} AS INT)
    END
{% endmacro %}
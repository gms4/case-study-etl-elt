{% macro convert_hits(column) %}
CASE
    -- Se o valor for nulo, retorna NULL
    WHEN {{ column }} IS NULL THEN NULL
    -- Se o valor contém "K", remove o "K", multiplica por 1000 e converte para float
    WHEN {{ column }} LIKE '%K' THEN
        CAST({{ strip_affix(column, 'K') }} AS FLOAT) * 1000
    -- Caso contrário, converte o valor diretamente para float
    ELSE CAST({{ column }} AS FLOAT)
END
{% endmacro %}

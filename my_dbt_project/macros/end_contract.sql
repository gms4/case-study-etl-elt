{% macro end_contract(type, contract, loan) %}
CASE
    -- Quando o tipo é "Contract", retorna os últimos 4 caracteres de "contract" como ano
    WHEN {{ type }} = 'Contract' THEN 
        CAST(SUBSTRING({{ contract }}, LENGTH({{ contract }}) - 3, 4) AS TEXT)

    -- Quando o tipo é "Loan", converte a data de "loan" para o formato DATE e extrai o ano
    WHEN {{ type }} = 'Loan' THEN
        CAST(
            EXTRACT(YEAR FROM TO_DATE({{ loan }}, 'Mon DD, YYYY')) AS TEXT
        )

    -- Caso contrário, retorna NULL ou pode ser tratado como 'No Club', se preferir
    ELSE 'No Club'
END
{% endmacro %}

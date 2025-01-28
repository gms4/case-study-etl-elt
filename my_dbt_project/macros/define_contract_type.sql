{% macro define_contract_type(column) %}
CASE
    WHEN {{ column }} LIKE '%Free%' THEN 'Free'
    WHEN {{ column }} LIKE '%Loan%' THEN 'Loan'
    WHEN {{ column }} LIKE '%~%' THEN 'Contract'
    ELSE NULL
END
{% endmacro %}

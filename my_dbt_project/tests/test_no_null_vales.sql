SELECT *
FROM {{ ref('ELT_clean_fifa_model') }}
WHERE id IS NULL
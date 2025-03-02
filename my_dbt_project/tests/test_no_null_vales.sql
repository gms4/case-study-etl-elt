SELECT *
FROM {{ ref('clean_fifa_model_elt') }}
WHERE id IS NULL
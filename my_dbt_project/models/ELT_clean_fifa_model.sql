{{ config(materialized='table') }}

WITH cleaned_data AS (
    SELECT
        *
        , {{ ft_to_cm('"height"') }} AS "height_cm"
        , {{ lbs_to_kg('"weight"') }} AS "weight_kg"
        , {{ format_money('"value"') }} / 1000000 AS "value_in_euro_millions"
        , {{ format_money('"wage"') }} AS "wage_in_euros"
        , {{ format_money('"release_clause"') }} / 1000000 AS "release_clause_in_euro_millions"
        , {{ end_contract('"type_of_contract"', '"contract"', '"loan_date_end"') }} AS "end_year"
    FROM (
        SELECT
            "ID" AS "id",
            "Name" AS "name",
            "Nationality" AS "nationality",
            "Age" AS "age",
            "↓OVA" AS "ova",
            "Wage" AS "wage",
            "Value" AS "value",
            "Release Clause" AS "release_clause",
            {{ remove_newlines('"Club"') }} AS "club",
            "POT" AS "pot",
            "Contract" AS "contract",
            {{ define_contract_type('"Contract"') }} AS "type_of_contract",
            {{ start_time_contract('"Contract"') }} AS "start_year",
            "Positions" AS "positions",
            {{ strip_affix('"Height"', 'cm') }} AS "height",
            {{ strip_affix('"Weight"', 'kg') }} AS "weight",
            "Preferred Foot" AS "preferred_foot",
            "BOV" AS "bov",
            "Best Position" AS "best_position",
            "Joined" AS "joined",
            "Loan Date End" AS "loan_date_end",
            CAST("Attacking" / 5 AS INT) AS "attacking",
            CAST("Skill" / 5 AS INT) AS "skill",
            CAST("Movement" / 5 AS INT) AS "movement",
            CAST("Power" / 5 AS INT) AS "power",
            CAST("Mentality" / 6 AS INT) AS "mentality",
            CAST("Defending" / 3 AS INT) AS "defending",
            CAST("Goalkeeping" / 5 AS INT) AS "goalkeeping",
            CAST({{ strip_affix('"W/F"', '★') }} AS INT) AS "wf",
            CAST({{ strip_affix('"SM"', '★') }} AS INT) AS "sm",
            "A/W" AS "aw",
            "D/W" AS "dw",
            CAST({{ strip_affix('"IR"', '★') }} AS INT) AS "ir",
            {{ convert_hits('"Hits"') }} AS "hits"
        FROM {{ source('staging', 'staging_fifa_model_elt') }}
    ) raw_data
)

SELECT * FROM cleaned_data

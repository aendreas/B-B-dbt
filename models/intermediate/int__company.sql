{{ config(materialized='ephemeral') }}


WITH movements AS (
    SELECT DISTINCT "company_id" 
    FROM {{ ref('stg__movements')}}
),

col AS (
    SELECT DISTINCT "company_id" 
    FROM {{ ref('stg__change_of_location')}}
),

unioned AS (
    SELECT DISTINCT "company_id"
    FROM movements UNION 
    SELECT DISTINCT "company_id"
    FROM col
),

final AS (
    SELECT DISTINCT u.company_id, c.company_name
    FROM unioned u INNER JOIN {{ ref('stg__companies')}} c ON (c.company_name = u.company_id)
    WHERE company_name NOT LIKE '%Govia%'
)

SELECT DISTINCT * FROM final
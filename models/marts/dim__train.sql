WITH final AS (
    SELECT * FROM {{ref('int__train')}}
)

SELECT * FROM final
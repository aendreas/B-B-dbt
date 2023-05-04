WITH final AS (
    SELECT * FROM {{ref('stg__date')}}
)

SELECT * FROM final
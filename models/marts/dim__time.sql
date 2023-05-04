WITH final AS (
    SELECT * FROM {{ref('stg__time')}}
)

SELECT * FROM final
WITH final AS (
    SELECT * FROM {{ref('int__company')}}
)

SELECT * FROM final
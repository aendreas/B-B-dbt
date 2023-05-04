WITH final AS (
    SELECT location_id, name, description, crs_code FROM {{ ref('stg__locations') }}
)

SELECT * FROM final
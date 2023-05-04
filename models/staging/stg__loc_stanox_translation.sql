WITH translation AS (
    SELECT CAST(loc_stanox AS CHAR(5)) AS loc_stanox,
    CAST(location_id AS CHAR(4)) AS location_id
    FROM {{ ref('loc_stanox_translation')}}
)

SELECT * FROM translation
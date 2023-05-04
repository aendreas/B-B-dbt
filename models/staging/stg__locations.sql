WITH locations AS (
    SELECT CAST(location_id AS CHAR(4)) AS location_id,
    CAST(name AS VARCHAR(40)) AS name,
    CAST(name AS VARCHAR(100)) AS description,
    CAST(crs AS VARCHAR(4)) AS crs_code

        FROM {{ source('locations', 'locations')}}
)

SELECT * FROM locations
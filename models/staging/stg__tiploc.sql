WITH tiploc AS (
    SELECT CAST(crs_code AS CHAR(3)) AS crs_code,
    CAST(description AS CHAR(100)) AS description,
    CAST(stanox AS CHAR(5)) AS stanox,
    CAST(tiploc_code AS VARCHAR(10)) AS tiploc_code,
    CAST(tps_description AS CHAR(100)) AS tps_description,
    CAST(transaction_type AS CHAR(6)) AS transaction_type,
    CAST(nlc_code AS CHAR(6)) AS nlc_code,
    CAST(year AS SMALLINT) AS year,
    CAST(month AS SMALLINT) AS month,
    CAST(day AS SMALLINT) AS day,
    CAST(hour AS SMALLINT) AS hour,
    CAST(minute AS SMALLINT) AS minute
    FROM {{ source('schedules', 'tiploc')}}
)

SELECT * FROM tiploc
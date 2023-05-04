WITH associations AS (
    SELECT CAST("CIF_stp_indicator" AS CHAR(1)) AS "CIF_stp_indicator",
    CAST(assoc_days AS CHAR(7)) AS assoc_days,
    CAST(assoc_end_date AS CHAR(23)) AS assoc_end_date,
    CAST(assoc_location_suffix AS CHAR(1)) AS assoc_location_suffix,
    CAST(assoc_start_date AS CHAR(23)) AS assoc_start_date,
    CAST(assoc_train_uid AS CHAR(6)) AS assoc_train_uid,
    CAST(base_location_suffix AS CHAR(1)) AS base_location_suffix,
    CAST(category AS CHAR(2)) AS category,
    CAST(date_indicator AS CHAR(1)) AS date_indicator,
    CAST(main_train_uid AS CHAR(6)) AS main_train_uid,
    CAST(transaction_type AS CHAR(6)) AS transaction_type,
    CAST(tiploc_code AS VARCHAR(10)) AS tiploc_code,
    CAST(year AS SMALLINT) AS year,
    CAST(month AS SMALLINT) AS month,
    CAST(day AS SMALLINT) AS day,
    CAST(hour AS SMALLINT) AS hour,
    CAST(minute AS SMALLINT) AS minute

    FROM {{ source('schedules', 'associations')}}
)

SELECT * FROM associations
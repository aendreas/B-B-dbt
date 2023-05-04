WITH ticket_sales AS (
    SELECT CAST(arrival_tiploc AS VARCHAR(10)) AS arrival_tiploc,
    CAST(departure_tiploc AS VARCHAR(10)) AS departure_tiploc,
    CAST(bought_at AS VARCHAR(10)) AS bought_at,
    CAST(class_name AS VARCHAR(8)) AS class_name,
    CAST(price AS NUMERIC(6,2)) AS price,
    CAST(sale_id AS VARCHAR(1000)) AS sale_id,
    CAST(class AS CHAR(1)) AS class,
    CAST(bought_online AS CHAR(1)) AS bought_online,
    CAST(year AS SMALLINT) AS year,
    CAST(month AS SMALLINT) AS month,
    CAST(day AS SMALLINT) AS day,
    CAST(hour AS SMALLINT) AS hour,
    CAST(minute AS SMALLINT) AS minute
    FROM {{ source('ticket-sales', 'ticket_sales')}}
)

SELECT * FROM ticket_sales
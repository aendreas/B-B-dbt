WITH companies AS (
    SELECT CAST(train_id AS CHAR(10)) AS train_id,
    CAST(end_time AS CHAR(4)) AS end_time,
    CAST(start_time AS CHAR(4)) AS start_time,
    CAST(loc_id_start AS CHAR(4)) AS loc_id_start,
    CAST(loc_id_end AS CHAR(4)) AS loc_id_end
    
    FROM {{ ref('schedules')}}
)

SELECT * FROM companies
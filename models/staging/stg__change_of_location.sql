WITH col AS (
    SELECT CAST(actual_timestamp AS BIGINT) AS actual_timestamp,
    CAST(auto_expected AS BOOLEAN) AS auto_expected,
    CAST(correction_ind AS BOOLEAN) AS correction_ind,
    CAST(delay_monitoring_point AS BOOLEAN) AS delay_monitoring_point,
    CAST(direction_ind AS VARCHAR(4)) AS direction_ind,
    CAST(event_source AS VARCHAR(9)) AS event_source,
    CAST(event_type AS VARCHAR(11)) AS event_type,
    CAST(gbtt_timestamp AS BIGINT) AS gbtt_timestamp,
    CAST(loc_stanox AS CHAR(5)) AS loc_stanox,
    CAST(next_report_run_time AS CHAR(1)) AS next_report_run_time,
    CAST(next_report_stanox AS CHAR(5)) AS next_report_stanox,
    CAST(offroute_ind AS BOOLEAN) AS offroute_ind,
    CAST(planned_event_type AS VARCHAR(11)) AS planned_event_type,
    CAST(planned_timestamp AS BIGINT) AS planned_timestamp,
    CAST(platform AS CHAR(2)) AS platform,
    CAST(reporting_stanox AS CHAR(5)) AS reporting_stanox,
    CAST(route AS CHAR(1)) AS route,
    CAST(timetable_variation AS SMALLINT) AS timetable_variation,
    CAST(toc_id AS CHAR(2)) AS company_id,
    CAST(train_id AS CHAR(10)) AS train_id,
    CAST(train_service_code AS CHAR(8)) AS train_service_code,
    CAST(train_terminated AS BOOLEAN) AS train_terminated,
    CAST(variation_status AS VARCHAR(7)) AS variation_status,
    CAST(year AS SMALLINT) AS year,
    CAST(month AS SMALLINT) AS month,
    CAST(day AS SMALLINT) AS day,
    CAST(hour AS SMALLINT) AS hour,
    CAST(minute AS SMALLINT) AS minute
    FROM {{ source('movements', 'change_of_location')}}
)

SELECT * FROM col
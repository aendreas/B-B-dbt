{%- set datepart = "minute" -%}
{%- set start_date = "TO_DATE('2023/02/01', 'yyyy/mm/dd')" -%}
{%- set end_date = "TO_DATE('2023/02/02', 'yyyy/mm/dd')" -%}

WITH date_spine AS (
    {{ dbt_utils.date_spine(datepart=datepart, 
                            start_date=start_date,
                            end_date=end_date) }}
),

date_spine_column AS (
    SELECT DATE_{{datepart}} AS AS_OF_DATE FROM date_spine

),

extracted_h_m AS (
    SELECT EXTRACT(HOUR FROM AS_OF_DATE) AS HOUR, EXTRACT(MINUTE FROM AS_OF_DATE) AS MINUTE FROM date_spine_column
),

final AS (
    SELECT lpad(HOUR::varchar, 2, '0') || lpad(MINUTE::varchar, 2, '0') AS hhmm, * FROM extracted_h_m
)


SELECT * FROM final
{%- set datepart = "day" -%}
{%- set start_date = "TO_DATE('2023/02/01', 'yyyy/mm/dd')" -%}
{%- set end_date = "TO_DATE('2023/05/01', 'yyyy/mm/dd')" -%}

WITH date_spine AS (
    {{ dbt_utils.date_spine(datepart=datepart, 
                            start_date=start_date,
                            end_date=end_date) }}
),

date_spine_column AS (
    SELECT DATE_{{datepart}} AS AS_OF_DATE FROM date_spine

),

extracted_y_m_d AS (
    SELECT EXTRACT(YEAR FROM AS_OF_DATE) AS YEAR, EXTRACT(MONTH FROM AS_OF_DATE) AS MONTH, EXTRACT(DAY FROM AS_OF_DATE) AS DAY FROM date_spine_column
),

final AS (
    SELECT YEAR::varchar || lpad(MONTH::varchar, 2, '0') || lpad(DAY::varchar, 2, '0') AS yyyymmdd, * FROM extracted_y_m_d
)

SELECT * FROM final

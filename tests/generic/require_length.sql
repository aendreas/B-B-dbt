{% test length(model, column_name, len) %}

WITH wrong_rows AS (
    SELECT {{ column_name }} FROM {{ model }} WHERE NOT LENGTH({{ column_name }}::varchar) =  {{ len }}
)

SELECT * FROM wrong_rows

{% endtest %}
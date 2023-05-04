{% test date_format(model, column_name) %}

WITH wrong_rows AS (
    SELECT {{ column_name }} FROM {{ model }} WHERE NOT {{ column_name }} ~ '^[0-9]{4}[0-9]{2}[0-9]{2}$'
)

SELECT * FROM wrong_rows

{% endtest %}
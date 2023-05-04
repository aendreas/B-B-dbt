{% test validate_assoc_days(model, column_name) %}

WITH wrong_rows AS (
    SELECT {{ column_name }} FROM {{ model }} WHERE NOT {{ column_name }} ~ '^[01]{7}'
)

SELECT * FROM wrong_rows

{% endtest %}
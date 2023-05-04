{% test positive(model, column_name) %}

WITH wrong_rows AS (
    SELECT {{ column_name }} FROM {{ model }} WHERE NOT {{ column_name }} >  0.0
)

SELECT * FROM wrong_rows

{% endtest %}
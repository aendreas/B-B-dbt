WITH movements AS (
    SELECT DISTINCT "train_id" AS "train_id",
    "train_service_code" AS "service_code"
    FROM {{ ref('stg__movements')}}
),

col AS (
    SELECT DISTINCT "train_id" AS "train_id" ,
    "train_service_code" AS "service_code"
    FROM {{ ref('stg__change_of_location')}}
),

final AS (
    SELECT DISTINCT "train_id"
    FROM movements UNION 
    SELECT DISTINCT "train_id"
    FROM col
)

SELECT DISTINCT * FROM final

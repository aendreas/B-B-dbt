WITH companies AS (
    SELECT CAST("Sector Code" AS CHAR(3)) AS sector_code,
    CAST("Company Name" AS CHAR(100)) AS company_name,
    CAST("Business Code" AS CHAR(2)) AS business_code,
    CASE 
        WHEN "Whitelisted" = 'Y' THEN True
        ELSE False
    END AS whitelisted
    FROM {{ ref('companies')}}
)

SELECT * FROM companies
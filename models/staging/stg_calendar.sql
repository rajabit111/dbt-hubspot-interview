WITH calendar AS (
    SELECT 
        listing_id,
        date,
        available,
        CAST(REPLACE(price, '$', '') AS FLOAT) AS price,
        minimum_nights,
        maximum_nights
    FROM {{ source('airbnb', 'calendar') }}
)
SELECT * FROM dbt_schema.calendar
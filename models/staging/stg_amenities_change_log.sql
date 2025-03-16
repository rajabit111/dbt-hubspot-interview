WITH amenities_change_log AS (
    SELECT 
        listing_id,
        change_at,
        amenities
    FROM {{ source('airbnb', 'amenities_change_log') }}
)
SELECT * FROM dbt_schema.amenities_change_log
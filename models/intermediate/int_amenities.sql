WITH latest_amenities AS (
    SELECT 
        listing_id,
        amenities,
        ROW_NUMBER() OVER (PARTITION BY listing_id ORDER BY change_at DESC) AS rn
    FROM {{ ref('stg_amenities_change_log') }}
)
SELECT 
    listing_id,
    amenities
FROM latest_amenities
WHERE rn = 1
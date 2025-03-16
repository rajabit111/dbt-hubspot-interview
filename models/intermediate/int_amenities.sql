WITH latest_amenities AS (
    SELECT 
        listing_id,
        amenities,
        ROW_NUMBER() OVER (PARTITION BY listing_id ORDER BY change_at DESC) AS rn
    FROM {{ ref('stg_amenities_change_log') }}
)
, exploded_amenities AS (
    SELECT 
        listing_id,
        value AS amenity_name  -- ✅ Extracts individual amenity values
    FROM latest_amenities
    {{ split_string_into_rows('amenities', ',') }}  -- ✅ Calls the macro
    WHERE rn = 1
)
SELECT * FROM exploded_amenities;
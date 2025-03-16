WITH final_data AS (
    SELECT 
        cal.listing_id,
        cal.date,
        cal.available,
        cal.price,
        lst.neighborhood,
        lst.property_type,
        lst.room_type,
        rev.review_score,
        amen.amenities
    FROM {{ ref('int_calendar_metrics') }} cal
    LEFT JOIN {{ ref('stg_listings') }} lst ON cal.listing_id = lst.listing_id
    LEFT JOIN {{ ref('stg_reviews') }} rev ON cal.listing_id = rev.listing_id
    LEFT JOIN {{ ref('int_amenities') }} amen ON cal.listing_id = amen.listing_id
)
SELECT * FROM final_data
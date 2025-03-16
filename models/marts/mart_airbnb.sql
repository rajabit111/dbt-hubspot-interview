SELECT 
    cal.listing_id,
    cal.date,
    cal.available,
    cal.price,
    lst.neighborhood,
    rev.review_score,
    amen.amenity_name  -- ✅ Now each amenity has its own row
FROM {{ ref('int_calendar_metrics') }} cal
LEFT JOIN {{ ref('stg_listings') }} lst ON cal.listing_id = lst.listing_id
LEFT JOIN {{ ref('stg_reviews') }} rev ON cal.listing_id = rev.listing_id
LEFT JOIN {{ ref('int_amenities') }} amen ON cal.listing_id = amen.listing_id;

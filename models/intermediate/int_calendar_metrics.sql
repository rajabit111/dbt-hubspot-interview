WITH booking_stats AS (
    SELECT 
        listing_id,
        date,
        available,
        price,
        COUNT(reservation_id) OVER (PARTITION BY listing_id) AS total_bookings
    FROM {{ ref('stg_calendar') }}
)
SELECT * FROM booking_stats
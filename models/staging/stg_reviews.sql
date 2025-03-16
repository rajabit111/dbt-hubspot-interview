WITH reviews AS (
    SELECT 
        listing_id,
        review_score,
        review_date
    FROM {{ source('airbnb', 'generated_reviews') }}
)
SELECT * FROM reviews
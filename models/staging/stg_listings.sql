with
    listings as (
        select
            id as listing_id,
            name as listing_name,
            host_id,
            neighborhood,
            property_type,
            room_type,
            cast(replace(price, '$', '') as float) as price
        from {{ source("airbnb", "listings") }}
    )
select *
from dbt_schema.listings

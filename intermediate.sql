/* INTERMEDIATE MODEL */
/* In this modeling layer, 
I want to join both tables together based on the common table 
listing_id with INNER JOIN because we want everything */

CREATE OR REPLACE VIEW `looker-airbnb-project-505911.intermediate.joined_airbnb_tables` 
AS (
  SELECT
  calendar.listing_id
  ,calendar.date_date
  ,calendar.is_available
  ,calendar.price_per_night
  ,listing.room_type
  ,listing.host_response_time
  ,listing.review_scores_value
FROM `looker-airbnb-project-505911.staging.calendar` AS calendar
INNER JOIN `looker-airbnb-project-505911.staging.listing` AS listing
ON calendar.listing_id = listing.listing_id
ORDER BY date_date
)

/* Making view where only is_available = true */
CREATE OR REPLACE VIEW `looker-airbnb-project-505911.intermediate.joined_airbnb_is_available_true` 
AS (
SELECT
    listing_id
  ,date_date
  ,price_per_night
  ,is_available
  ,host_response_time
  ,room_type
  ,review_scores_value
FROM `looker-airbnb-project-505911.intermediate.joined_airbnb_tables` 
GROUP BY 1,2,3,4,5,6,7
HAVING is_available = true
ORDER BY 3 DESC
)


-- /* Making view where only is_available = false */
CREATE OR REPLACE VIEW `looker-airbnb-project-505911.intermediate.joined_airbnb_is_available_false` 
AS (
SELECT
  listing_id
  ,date_date
  ,price_per_night
  ,is_available
  ,host_response_time
  ,room_type
  ,review_scores_value
FROM `looker-airbnb-project-505911.intermediate.joined_airbnb_tables` 
GROUP BY 1,2,3,4,5,6,7
HAVING is_available = false
ORDER BY 3 DESC
)



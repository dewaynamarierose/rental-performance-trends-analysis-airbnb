/* STAGING TABLES */
/* In this modeling layer, we will create staging tables to clean and transform the raw data before making any joins in the intermediate layer. */

/* Checking for any null values and removing them */
SELECT
id
,COUNT(*) AS nb
FROM `looker-airbnb-project-505911.raw_data.listing`
GROUP BY id
HAVING nb > 1
OR nb IS NULL
;

SELECT
listing_id
,date AS date_date
,available
,COUNT(*) AS nb
FROM `looker-airbnb-project-505911.raw_data.calendar `
GROUP BY listing_id, date_date, available
HAVING nb > 1
OR nb IS NULL
OR available IS NULL
;
/* CONFIRMED: No null values that need to be removed from any tables */

/* What are the changes that need to be made to the raw data before joining the tables? */
  -- making column name for id the same for both tables: "listing_id" and CAST AS string
  -- price > price_per_night and CAST AS FLOAT64
  -- available > is_available
  -- date > date_date

/*Here are the staging tables that will be created to clean and transform the raw data before making any joins in the intermediate layer.*/

CREATE OR REPLACE VIEW `looker-airbnb-project-505911.staging.listing` 
AS(
  SELECT
    CAST(id AS STRING) AS listing_id
    ,room_type
    ,host_response_time
    ,review_scores_value
  FROM `looker-airbnb-project-505911.raw_data.listing`
)

CREATE OR REPLACE VIEW `looker-airbnb-project-505911.staging.calendar` 
AS (
  SELECT
  CAST(listing_id AS STRING) AS listing_id
  ,date AS date_date
  ,available AS is_available
  ,CAST(price AS FLOAT64) AS price_per_night
FROM `looker-airbnb-project-505911.raw_data.calendar `
) 

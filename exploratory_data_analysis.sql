/* EXPLORATORY DATA ANALYSIS FOR AIRBNB DATA */

/* 1.What are the tables we are working with? */
  ## two tables: 
  -- `looker-airbnb-project-505911.raw_data.calendar ` 
  -- `looker-airbnb-project-505911.raw_data.listing`

/* 2.What is the timespan of our data? */

SELECT
date
FROM `looker-airbnb-project-505911.raw_data.calendar ` 
ORDER BY date
;
-- ANSWER: Our data starts from 2022-09-09 and ends at 2023-01-31

SELECT
*
FROM `looker-airbnb-project-505911.raw_data.listing`
;
-- ANSWER: No date listed

/* 3. Do the tables have a common column in common? */
SELECT
*
FROM `looker-airbnb-project-505911.raw_data.listing`
;
-- ANSWER: Yes listing_id /id

SELECT
*
FROM `looker-airbnb-project-505911.raw_data.calendar ` 
;

/* 3. What is the primary key for the tables? */
SELECT
id
,COUNT(*) AS nb
FROM `looker-airbnb-project-505911.raw_data.listing`
GROUP BY id
HAVING nb > 1
OR nb IS NULL
;
-- ANSWER: listing has id as PRIMARY KEY

SELECT
listing_id
,date AS date_date
,COUNT(*) AS nb
FROM `looker-airbnb-project-505911.raw_data.calendar `
GROUP BY listing_id, date_date
HAVING nb > 1
OR nb IS NULL
;
-- ANSWER: listing id and date together are the PRIMARY KEY for calendar

/*4. How many unique IDs are there? */
SELECT
COUNT (DISTINCT id) AS count_id
FROM `looker-airbnb-project-505911.raw_data.listing`
;
-- ANSWER: 500 unique ids
SELECT
COUNT (DISTINCT listing_id) AS count_id
FROM `looker-airbnb-project-505911.raw_data.calendar ` 
;
-- ANSWER: 500 unique ids


/*LISTING TABLE*/
/* How many room_type are there? */
SELECT
room_type
,COUNT(id) AS nb_listing_id
FROM `looker-airbnb-project-505911.raw_data.listing`
GROUP BY 1
;
-- ANSWER: 3 room types
    -- Entire home/apt	450
    -- Private room	49
    -- Shared room	1

/* How many host_response_time options are there? */
SELECT
host_response_time
,COUNT(id) AS nb_listing_id
FROM `looker-airbnb-project-505911.raw_data.listing`
GROUP BY 1
;
-- ANSWER: 4 host_response_time options
     -- 1 within a day	124
      -- 2	within an hour	211
      -- 3	a few days or more	22
      -- 4	within a few hours	143

/* What are the review_score_values? */
SELECT
review_scores_value
,COUNT(id) AS nb_listing_id
FROM `looker-airbnb-project-505911.raw_data.listing`
GROUP BY 1 
ORDER BY 1 DESC
;

/* What is the row count? */
SELECT
COUNT(*) AS nb_rows
FROM `looker-airbnb-project-505911.raw_data.listing`
;

/* CALENDAR TABLE */
/* What is the total revenue? */
SELECT
ROUND(SUM(price)) AS total_price
FROM `looker-airbnb-project-505911.raw_data.calendar ` 
WHERE available = false
;
-- ANSWER: Total revenue is 18060720.0


/* What is the row count? */
SELECT
COUNT(*) AS nb_rows
FROM `looker-airbnb-project-505911.raw_data.calendar ` 
;

/* What are the available options? */
SELECT
available
,COUNT(listing_id) AS nb_listing_id
FROM `looker-airbnb-project-505911.raw_data.calendar ` 
GROUP BY 1
;
-- ANSWER: 2 available options
-- false	54565
-- true	17536

SELECT
*
FROM `looker-airbnb-project-505911.raw_data.calendar ` 
WHERE available = false
;
/* This means price represents nightly rate
so available means false = booked/unavailable and true would mean open for booking
*/ 

SELECT
ROUND(SUM(price)) AS total_price
FROM `looker-airbnb-project-505911.raw_data.calendar ` 
WHERE available = true
;

/* What is the total price? */
    -- 18060720.0
SELECT
ROUND(SUM(price)) AS total_price
FROM `looker-airbnb-project-505911.raw_data.calendar ` 
;
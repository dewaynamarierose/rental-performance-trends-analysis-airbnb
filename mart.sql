/* MART MODEL */
/* 
In this modeling layer, 
I am double checking if any view rows are repeated during joining process then creating the final 
mart model 
*/

SELECT 
  listing_id
  ,date_date
  ,COUNT(*) AS nb_rows
FROM `looker-airbnb-project-505911.intermediate.joined_airbnb_tables` 
GROUP BY listing_id, date_date
HAVING nb_rows > 1
OR listing_id IS NULL
OR date_date IS NULL 
;

-- CONCLUSION: I see no repeated rows -- result show no data to display

/*Here I adouble checking if row count is same as original calendar table which was 72101 Rows */ 
SELECT
  COUNT(*) AS joined_row_count
FROM `looker-airbnb-project-505911.intermediate.joined_airbnb_tables` 
;
-- CONCLUSION: Yes row count is the same 72101

/* I will now create MART MODEL table from intermediate model */

CREATE OR REPLACE TABLE `looker-airbnb-project-505911.mart.airbnb_project_table` 
AS (
  SELECT
    *
  FROM `looker-airbnb-project-505911.intermediate.joined_airbnb_tables` 
)

/* I actually will add two final tables additionally where the
 is_available column is ONLY true and another where is_available is ONLY FALSE
 */

/* TRUE TABLE */
CREATE OR REPLACE TABLE `looker-airbnb-project-505911.mart.airbnb_booking_availibility_true` 
AS (
  SELECT
    *
  FROM `looker-airbnb-project-505911.intermediate.joined_airbnb_is_available_true` 
)

/* FALSE TABLE */
CREATE OR REPLACE TABLE `looker-airbnb-project-505911.mart.airbnb_booking_availibility_false` 
AS (
  SELECT
    *
  FROM `looker-airbnb-project-505911.intermediate.joined_airbnb_is_available_false` 
)
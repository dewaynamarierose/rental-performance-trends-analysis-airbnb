
# Rental Performance & Trends Analysis with Airbnb

In this analysis, I analyzed Airbnb's rental performance in Paris to explore revenue, occupancy, pricing trends and host responsiveness. Through this analysis I also applied dbt style modeling conventions to be able to collaborate code with teammates in a clean and scalable structure.

## Executive Summary:
Using SQL, my team and I pulled real listing and booking data from BigQuery that was provided by LeWagon bootcamp and created a dashboard to explore why some Airbnb hosts are renting more than others. After finding faster response times from hosts bring in more bookings and higher earnings,we reccomended that hosts should enable instant bookings and auto replies. We also found during the observed date range that October was Airbnb's best month. To this conclusion, we reccomended testing if offering small seasonal discounts can boost bookings. 

## Business Problem:
Airbnb wants to understand why some hosts in Paris are receiving more booking than others. Airbnb has data on pricing, property types, guest reviews, host response times and other possible factors that may influence rental performance. However, it is not clear what factors are actually associated with higher booking activity. 

Our team's analysis can help identify these factors and help Airbnb's Customer Success team with insights to increase bookings, improve rental performance and better strategies to support hosts. 

## Methodology
 1. **Data Preparation:** Explored and joined Airbnb listing and calendar data using SQL in BigQuery
2. **Data Modeling:** Applied dbt style modeling conventions to organize data into raw, staging, and intermediate layers
3. **Data Analysis:** Analyzed booking and revenue trends over time, comparing room types, pricing, guest ratings and host response times to identify patterns linked to higher booking activity.
4. **Dashboard Development:** Built an interactive Data Studio dashboard to visualize trends, highlight findings, and present recommendations

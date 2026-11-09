--Explore the orders table to better understand what is being ordered and when

/*
Question:
What is the date range of the table?

Finding:
The order_details table contains order records spanning
January 1, 2023, through March 31, 2023.
*/

SELECT MIN(order_date) AS minimum_date,
MAX(order_date) AS maximum_date
FROM workspace.restaurant_db.order_details;

--===================================================================

--Count how many orders were made and how many items were ordered within this date range
SELECT COUNT(DISTINCT order_id) AS unique_orders_places,
       COUNT(*) AS total_order-detail_records
FROM workspace.restaurant_db.order_details
WHERE order_date BETWEEN '2023-01-01' AND '2023-03-31';

--=============================================================

--Which orders had the most number of items?
SELECT order_id,
       COUNT(order_details_id) AS item_count
FROM workspace.restaurant_db.order_details
GROUP BY order_id
ORDER BY COUNT(order_details_id) DESC;

--================================================================

--How many orders had more than 12 items?
WITH order_count AS (
SELECT order_id,
       COUNT(order_details_id) AS item_count
FROM workspace.restaurant_db.order_details
GROUP BY order_id
)
 SELECT
  COUNT(*) AS orders_more_than_12
  FROM order_count
  WHERE item_count > 12;


/*
 Analyze Customer Behavior 
View the details of the highest spend order */

--Business Question: Which specific items were purchased in the highest spend?

WITH sum_order AS(
SELECT
    d.order_id,
    SUM(m.price) AS total_price
FROM workspace.restaurant_db.order_details AS d
LEFT JOIN workspace.restaurant_db.menu_items AS m
ON menu_item_id = item_id
GROUP BY d.order_id
ORDER BY total_price DESC
LIMIT 1
) 
SELECT 
   s.order_id,
   s.total_price,
   m.item_name
FROM sum_order AS s
LEFT JOIN workspace.restaurant_db.order_details AS d
ON s.order_id = d.order_id
LEFT JOIN workspace.restaurant_db.menu_items AS m
ON menu_item_id = d.item_id
ORDER BY m.item_name ASC;

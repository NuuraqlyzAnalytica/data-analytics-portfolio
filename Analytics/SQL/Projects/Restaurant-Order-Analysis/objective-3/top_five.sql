/* Analyze Customer Behavior */

--What were the top 5 orders that spent the most money?

SELECT
    d.order_id,
    SUM(m.price) AS total_price
FROM workspace.restaurant_db.order_details AS d
LEFT JOIN workspace.restaurant_db.menu_items AS m
ON menu_item_id = item_id
GROUP BY d.order_id
ORDER BY total_price DESC
LIMIT 5; 

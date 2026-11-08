/*
Analyze Customer Behavior

The goal is to understand which menu items customers prefer
and how spending is distributed across individual orders.

Business Question: What were the least and most ordered items? What categories were they in?
*/

--Least ordered items
With item_counts AS( --Count items
SELECT m.category AS category,
       m.item_name AS item_name,
       COUNT(d.order_details_id) AS order_count
FROM workspace.restaurant_db.menu_items AS m
JOIN workspace.restaurant_db.order_details AS d
ON m.menu_item_id = d.item_id
GROUP BY m.category,
         m.item_name
ORDER BY order_count ASC 
),
item_rankings AS ( --Create rank to separate count
    SELECT
        category,
        item_name,
        order_count,
        RANK() OVER (ORDER BY order_count ASC) AS least_rank,
        RANK() OVER (ORDER BY order_count DESC) AS most_rank
    FROM item_counts

)
SELECT
 CASE  --crate new columns and organize ranked items into least and most ordered items
    WHEN least_rank = 1 THEN "Least Order"
    WHEN most_rank = 1 THEN "Most Ordered"
END AS order_status,
category,
item_name,
order_count
FROM item_rankings
WHERE least_rank = 1
    OR most_rank = 1
ORDER BY order_status ASC;

/* Data quality assessment of the order_details table */


--Inspecting the order details schema
DESCRIBE workspace.restaurant_db.order_details;

--Inspecting size of the table - Are values missing?
SELECT COUNT(*) AS `Total Rows`,
    COUNT(order_details_id) AS `Total order_details_id`,
    COUNT(order_id) AS `Total order_id`,
    COUNT(order_date) AS `Total order_date`,
    COUNT(order_time) AS `Total order_time`,
    COUNT(item_id) AS `Total item_id`
FROM workspace.restaurant_db.order_details;

--Checking distinct values - 
SELECT 
    COUNT(DISTINCT order_details_id) AS `Distinct order_details_id`,
    COUNT(DISTINCT order_id) AS `Distinct order_id`,
    COUNT(DISTINCT order_date) AS `Distinct order_date`,
    COUNT(DISTINCT order_time) AS `Distinct order_time`,
    COUNT(DISTINCT item_id) AS `Distinct item_id`   
FROM workspace.restaurant_db.order_details;

--Checking missing values in the order details table
SELECT 
COUNT(*) AS `Total Rows`,
COUNT(*) - COUNT(order_details_id) AS `Missing order_details_id`,
COUNT(*) - COUNT(order_id) AS `Missing order_id`,
COUNT(*) - COUNT(order_date) AS `Missing order-date`,
COUNT(*) - COUNT(order_time) AS `Missing order_time`,
COUNT(*) - COUNT(item_id) AS `Missing item_id`
FROM workspace.restaurant_db.order_details
LIMIT 10;

--Checking location of missing item_ids
SELECT *
FROM workspace.restaurant_db.order_details
WHERE order_details_id IS NULL
OR order_id IS NULL
OR order_date IS NULL
OR order_time IS NULL 
OR item_id IS NULL;

--Checking the item_id missing values
SELECT *
FROM workspace.restaurant_db.order_details
WHERE item_id IS NULL;

--Check if missing item_id is a duplicated order
SELECT order_id,
COUNT(*) AS `Missing Item_ID`
FROM workspace.restaurant_db.order_details
WHERE item_id IS NULL
GROUP BY order_id
ORDER BY `Missing Item_iD`;

-- Inspecting order contents and missing item IDs
SELECT
    order_id,
    item_id,
    COUNT(*) OVER (PARTITION BY order_id) AS `Total Detail Records`,
    COUNT(item_id) OVER (PARTITION BY order_id) AS `Known Item IDs`,
    COUNT(*) OVER (PARTITION BY order_id)
        - COUNT(item_id) OVER (PARTITION BY order_id) AS `Missing Item IDs`
FROM workspace.restaurant_db.order_details
WHERE order_id = 5303;

--- Checking missing items by order
SELECT
    order_id,
    COUNT(*) AS `Total Orders`,
    COUNT(item_id) AS `Known Item IDs`,
    COUNT(*) - COUNT(item_id) AS `Missing Item IDs`
FROM workspace.restaurant_db.order_details
GROUP BY order_id
ORDER BY `missing item ids` DESC, order_id;



SELECT
    order_id,
    COUNT(*) AS total_detail_records,
    COUNT(item_id) AS known_item_ids,
    COUNT(*) - COUNT(item_id) AS missing_item_ids
FROM workspace.restaurant_db.order_details
GROUP BY order_id
ORDER BY order_id;

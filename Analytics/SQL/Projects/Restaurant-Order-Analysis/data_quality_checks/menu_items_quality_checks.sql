/* Data quality assessment of the menu_items table */

USE workspace.restaurant_db;

--Checking the data type in the table
DESCRIBE workspace.restaurant_db.menu_items;

--Missing data check on Menu Items Dataset
SELECT 
COUNT(*) AS `Total Items`,
COUNT(*)-  COUNT(menu_item_id) AS `Missing Total Menu Items`,
COUNT(*) - COUNT(item_name) AS `Missing Item_Name`,
COUNT(*) - COUNT(category) AS  `Missing Category`,
COUNT(*) - COUNT(price)  AS `Missing Price`
FROM workspace.restaurant_db.menu_items;

SELECT (*)
FROM workspace.restaurant_db.menu_items
WHERE menu_item_id IS NULL OR item_name IS NULL OR category IS NULL OR price IS NULL;

--Are any menu item prices zero, negative, or otherwise suspicious?
SELECT menu_item_id, item_name, price
FROM workspace.restaurant_db.menu_items
WHERE price <= 0;

--Checking the range of menu items prices
SELECT MIN(price) AS `Min Price`, MAX(price) AS `Max Price`, ROUND(AVG(price),2) AS `Average Price`
FROM workspace.restaurant_db.menu_items;

--Checking  the top 3 cheapest menu items
SELECT menu_item_id, item_name, category, price
FROM workspace.restaurant_db.menu_items
ORDER BY price ASC
LIMIT 3;

--Checking  the top 3 expensive menu items
SELECT menu_item_id, item_name, category, price
FROM workspace.restaurant_db.menu_items
ORDER BY price DESC, item_name ASC
LIMIT 3;


--Checking the length of the menu_items_id longer than three digits
SELECT menu_item_id AS `Menu Item IDs`
FROM workspace.restaurant_db.menu_items
WHERE length(CAST(menu_item_id AS string)) != 3
ORDER BY length(CAST(menu_item_id AS string)) DESC;

--Checking for whitespaces
SELECT category
FROM workspace.restaurant_db.menu_items
WHERE category != TRIM(category);

--Inspect Distinct Categories
SELECT DISTINCT category
FROM workspace.restaurant_db.menu_items;


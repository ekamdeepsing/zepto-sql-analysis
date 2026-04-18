-- Zepto SQL Business Analysis Project
-- Author: Ekamdeep Singh

-- Q1: Top 10 best-value products based on discount
SELECT name, mrp, discountpercent
FROM zepto
WHERE discountpercent IS NOT NULL
ORDER BY discountpercent DESC
LIMIT 10;

-- Q2: High MRP but out of stock
SELECT name, mrp
FROM zepto
WHERE outofstock = true
AND mrp > 300
ORDER BY mrp DESC;

-- Q3: Estimated revenue per category
SELECT category,
       SUM(discountedsellingprice * availablequantity) AS revenue
FROM zepto
GROUP BY category
ORDER BY revenue DESC;

-- Q4: MRP > 500 and discount < 10%
SELECT name, mrp, discountpercent
FROM zepto
WHERE mrp > 500
AND discountpercent < 10
ORDER BY mrp DESC;

-- Q5: Top 5 categories with highest average discount
SELECT category,
       ROUND(AVG(discountpercent), 2) AS avg_discount
FROM zepto
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;

-- Q6: Price per gram for products > 100g
SELECT name,
       discountedsellingprice,
       weightInGms,
       (discountedsellingprice / weightInGms) AS price_per_gram
FROM zepto
WHERE weightInGms > 100
ORDER BY price_per_gram ASC;

-- Q7: Group products into size categories
SELECT name,
       weightInGms,
       CASE 
           WHEN weightInGms < 1000 THEN 'Low'
           WHEN weightInGms BETWEEN 1000 AND 5000 THEN 'Medium'
           ELSE 'Bulk'
       END AS weight_category
FROM zepto;

-- Q8: Total inventory weight per category
SELECT category,
       SUM(weightInGms * availablequantity) AS total_weight
FROM zepto
GROUP BY category
ORDER BY total_weight DESC;
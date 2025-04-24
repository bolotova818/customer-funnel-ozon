
WITH Orders_count AS (
  SELECT customer_id, COUNT(order_id) AS order_count
  FROM Ozon_Orders
  GROUP BY customer_id
)

SELECT
  stage,
  COUNT(*) AS customer_count
FROM (
  SELECT
    customer_id,
    order_count,
    CASE
      WHEN order_count = 1 THEN '1 заказ'
      WHEN order_count = 2 THEN '2 заказа'
      WHEN order_count = 3 THEN '3 заказа'
      WHEN order_count = 4 THEN '4 заказа'
      WHEN order_count = 5 THEN '5 заказов'
      WHEN order_count BETWEEN 6 AND 9 THEN '6–9 заказов'
      WHEN order_count BETWEEN 10 AND 15 THEN '10–15 заказов'
      ELSE '16+ заказов'
    END AS stage
  FROM Orders_count
)
GROUP BY stage
ORDER BY customer_count DESC;

SELECT p.first_name, 
p.last_name,
COUNT(DISTINCT o.id) total_orders,
SUM(oi.quantity) total_items_bought,
SUM(oi.quantity*i.price - oi.discount) total_money_spent
FROM person p
LEFT JOIN order o
ON o.person_id=p.id
LEFT JOIN order_item oi
ON o.id=oi.order_id
LEFT JOIN item i
ON oi.item_id=i.id
GROUP BY p.id;

-- number of orders per customer
select distinct
customers.id as customer_id
,customers.name
,customers.email
,min(orders.created_at) over (partition by customer_id) as first_order_at
,count(orders.id) over (partition by customer_id) as number_of_orders
from analytics-engineers-club.coffee_shop.customers customers
left join analytics-engineers-club.coffee_shop.orders orders
on customers.id = orders.customer_id
order by first_order_at
limit 5
;

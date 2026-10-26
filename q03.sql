select 
order_id,
customer_id,
item,
amount
from orders
where status='completed'
order by amount desc, order_id asc
limit 5
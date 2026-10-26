select 
status, 
count(order_id) as number_of_orders, 
sum(amount) as total_amount
from orders
group by status
order by number_of_orders desc
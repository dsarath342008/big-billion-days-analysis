select
c.customer_id, 
c.first_name, 
c.last_name, 
c.region
from customers as c
left join orders as o
on c.customer_id = o.customer_id
where o.order_id is null
order by c.customer_id


select 
o.order_id, 
o.order_month, 
c.first_name, 
c.last_name, 
c.region,
r.rep_name, 
o.item, 
o.quantity, 
o.amount, 
status
from orders as o
left join customers as c
on o.customer_id=c.customer_id
left join reps as r
on c.rep_id=r.rep_id
order by order_id
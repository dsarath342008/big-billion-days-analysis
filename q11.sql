select
c.region, 
o.order_month, 
count(o.order_id) as number_of_orders, 
count(distinct o.customer_id) as number_of_customers, 
sum(o.amount) as total_revenue, 
avg(o.amount) as average_revenue
from orders as o
left join customers as c
on o.customer_id = c.customer_id
where o.status='completed'
group by c.region,o.order_month
order by c.region,o.order_month
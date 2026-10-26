select 
item, 
sum(amount) as total_revenue,
case
  when sum(amount)>=60000 then 'High'
  when sum(amount)>=15000 then 'Medium'
else
   'Low'
end as performance_tier
from orders
where status='completed'
group by item
order by total_revenue desc   
   
  
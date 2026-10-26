select
customer_id,
first_name, 
last_name, 
region, 
age
from customers
where region in ('North' ,'West')
and age between 25 and 40
order by age asc,customer_id asc


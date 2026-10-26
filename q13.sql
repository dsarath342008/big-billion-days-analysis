select 
r.rep_name,
o.order_month,
r.monthly_target,
sum(o.amount) as revenue,
case
    when sum(o.amount)<r.monthly_target then 'Below Target'
    when sum(o.amount)=r.monthly_target*1.1 then 'On Target'
else
    'Above Target'
end as performance_tier
from reps as r
left join customers as c
on r.rep_id = c.rep_id
left join orders as o
on c.customer_id = o.customer_id
where o.status='completed'
group by r.rep_name,o.order_month,r.monthly_target
order by r.rep_name,o.order_month
    


select 
round(sum(case when a.order_date = a.customer_pref_delivery_date then 1 else 0 end) / count(*) * 100 , 2)
as immediate_percentage
from 
(
select * ,
dense_rank() over(partition by customer_id order by order_date) as rnk
from Delivery
) a
where a.rnk=1
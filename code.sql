--total call duration between each individual

with cte as (
select 
case when caller<receiver then caller else receiver end caller,
case when caller<receiver then receiver else caller end receiver,
duration
from call_logs)

select caller,receiver, sum(duration) as dur
from cte
group by caller,receiver

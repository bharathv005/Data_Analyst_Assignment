use clinic_management;

-- 1. find the revenue we got from each sales channel in a given year
select sales_channel,sum(amount)as revenue
from clinic_sales
where year(datetime)=2021
group by sales_channel;

-- 2. find top 10 the most valuable customers for a given year
select c.name,sum(cs.amount)as total_spent
from clinic_sales cs
join customer c on cs.uid=c.uid
where year(cs.datetime)=2021
group by cs.uid,c.name
order by total_spent desc
limit 10;

-- 3. find month wise revenue, expense, profit , status (profitable / not-profitable) for a given year
select s.month, s.revenue, coalesce(e.expense,0)as expense,
(s.revenue-coalesce(e.expense,0))as profit,
case
when(s.revenue-coalesce(e.expense,0))>0 then'profitable'
else'not-profitable'
end as status
from(
select month(datetime)as month,sum(amount)as revenue
from clinic_sales where year(datetime)=2021 group by month
)s
left join(
select month(datetime)as month,sum(amount)as expense
from expenses where year(datetime)=2021 group by month
)e on s.month=e.month
order by s.month;

-- 4. for each city find the most profitable clinic for a given month
select city, cid, clinic_name, total_sales, total_expenses, profit
from(
select cl.city, cl.cid, cl.clinic_name,
coalesce(s.total_sales,0)as total_sales,
coalesce(e.total_expenses,0)as total_expenses,
coalesce(s.total_sales,0)-coalesce(e.total_expenses,0)as profit,
rank()over(partition by cl.city order by
coalesce(s.total_sales,0)-coalesce(e.total_expenses,0)desc)as rnk
from clinics cl
left join(
select cid,sum(amount)as total_sales
from clinic_sales
where month(datetime)=1 and year(datetime)=2021
group by cid
)s on cl.cid=s.cid
left join(
select cid,sum(amount)as total_expenses
from expenses
where month(datetime)=1 and year(datetime)=2021
group by cid
)e on cl.cid=e.cid
)ranked_clinics
where rnk=1
order by profit desc;

-- 5. for each state find the second least profitable clinic for a given month
select state, cid, clinic_name, total_sales, total_expenses, profit
from(
select
cl.state,
cl.cid,
cl.clinic_name,
coalesce(s.total_sales,0)as total_sales,
coalesce(e.total_expenses,0)as total_expenses,
coalesce(s.total_sales,0)-coalesce(e.total_expenses,0)as profit,
rank()over(partition by cl.state order by
coalesce(s.total_sales,0)-coalesce(e.total_expenses,0)asc)as rnk
from clinics cl
left join(
select cid,sum(amount)as total_sales
from clinic_sales
where month(datetime)=1 and year(datetime)=2021
group by cid
)s on cl.cid=s.cid
left join(
select cid,sum(amount)as total_expenses
from expenses
where month(datetime)=1 and year(datetime)=2021
group by cid
)e on cl.cid=e.cid
)ranked_clinics
where rnk=2
order by state;
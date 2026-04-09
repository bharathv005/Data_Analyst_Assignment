-- 1.For every user in the system, get the user_id and last booked room_no
select b.user_id,b.room_no
from bookings b
join(
select user_id,max(booking_date) as latest
from bookings
group by user_id
)t
on b.user_id=t.user_id and b.booking_date=t.latest;


-- 2.Get booking_id and total billing amount of every booking created in November, 2021
select
b.booking_id,
sum(bc.item_quantity*i.item_rate) as total_amount
from bookings b
join booking_commercials bc
on b.booking_id=bc.booking_id
join items i
on bc.item_id=i.item_id
where month(b.booking_date)=11
and year(b.booking_date)=2021
group by b.booking_id;


-- 3.Get bill_id and bill amount of all the bills raised in October, 2021 having bill amount >1000
select bc.bill_id,
sum(bc.item_quantity*i.item_rate) as bill_amount
from booking_commercials bc
join items i on bc.item_id=i.item_id
where month(bc.bill_date)=10 and year(bc.bill_date)=2021
group by bc.bill_id
having bill_amount>1000;


-- 4.Determine the most ordered and least ordered item of each month of year 2021
select month, item_name, total_quantity, order_type
from(
select
month(b.booking_date) as month, i.item_name,
sum(bc.item_quantity) as total_quantity,
rank() over( partition by month(b.booking_date) order by sum(bc.item_quantity) desc) as rnk_desc,
rank() over( partition by month(b.booking_date) order by sum(bc.item_quantity) asc) as rnk_asc
from booking_commercials bc
join bookings b on bc.booking_id=b.booking_id
join items i on bc.item_id=i.item_id
where year(b.booking_date)=2021
group by month(b.booking_date),i.item_name
)t
join(select 'most ordered' as order_type,1 as rnk
union
select 'least ordered',1)labels
on(t.rnk_desc=labels.rnk and labels.order_type='most ordered')
or(t.rnk_asc=labels.rnk and labels.order_type='least ordered')
order by month,order_type;

-- 5.Find the customers with the second highest bill value of each month of year 2021
select month, user_id, name, bill_id, total_bill
from(
select month(b.booking_date) as month, u.user_id, u.name, bc.bill_id,
sum(bc.item_quantity*i.item_rate) as total_bill,
dense_rank() over( partition by month(b.booking_date) order by sum(bc.item_quantity*i.item_rate) desc) as rnk
from booking_commercials bc
join bookings b on bc.booking_id=b.booking_id
join users u on b.user_id=u.user_id
join items i on bc.item_id=i.item_id
where year(b.booking_date)=2021
group by month(b.booking_date),u.user_id,u.name,bc.bill_id
)t
where rnk=2
order by month;
use mock_sba_db;

select o.ORDER_ID , o.USER_ID,  o.STORE_ID  from orders as o
join users as u on o.USER_ID  = u.USER_ID  
 where u.FIRST_NAME = 'Marion'
;


--
-- Q2
--
select u.USER_ID ,u.FIRST_NAME , u.LAST_NAME  , u.CITY 
from users  as u 
left join orders as o on u.USER_ID = o.user_id 
where order_id is null;

--
-- Q3
--
select i.NAME , i.PRICE from items as i
join order_items oi on i.ITEM_ID = oi.ITEM_ID 
join orders o on oi.ORDER_ID = o.ORDER_ID
group by i.name
having Count(o.ORDER_ID) >= 2
;

--
-- Q4
--
select o.order_id , i.NAME, i.PRICE , oi.QUANTITY  from orders as o 
join order_items oi on oi.ORDER_ID = o.ORDER_ID
join items as i on i.ITEM_ID = oi.ITEM_ID 
join stores as s on o.STORE_ID = s.STORE_ID 
where s.CITY  = 'New York'
order by  o.ORDER_ID asc, i.PRICE desc;
;

--
-- Q5
--
select i.Name as 'ITEM_NAME', SUM(oi.quantity*i.price) as REVENUE from order_items oi 
join items as i  on oi.ITEM_ID = i.ITEM_ID 
group by i.NAME ;

--
-- Q6
--
select s.NAME, COUNT(o.ORDER_ID) as `ORDER_QUANTITY`,
case 
  when count(o.ORDER_ID) > 3 then 'High'
  when count(o.ORDER_ID) > 1 then 'Medium'
  else 'Low'
  end as 'SALES_FIGURE'
from stores as s
join orders as o on s.STORE_ID = o.STORE_ID 
-- join order_items as oi on o.ORDER_ID = oi.ORDER_ID
group by s.NAME
order by  `ORDER_QUANTITY` desc;
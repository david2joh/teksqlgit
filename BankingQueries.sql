use banking;
--
-- Q1
--
select
	name as 'Product' ,
	product_type_cd as 'Type'
from
	product;
--
-- Q2
--
select
	b.name as 'Branch Name' ,
	b.city as 'City' ,
	e.last_name as 'Last_name',
    e.title as 'Title'
from branch as b
inner join employee as e on
	b.branch_id = e.ASSIGNED_BRANCH_ID
order by
	b.name;
--
-- Q3
--
select title from employee group by title;
--
-- Q4
--
select
	e.last_name as 'Last Name',
	e.title as 'Title',
	e1.last_name as 'Manager Last_name',
	e1.title as 'Manager Title'
from
	employee as e
join employee as e1
	on
	e1.emp_id = e.SUPERIOR_EMP_ID
;
--                         
-- Q5
--
select 
	p.product_type_cd as 'Product ',
	a.avail_balance as 'Available Balance',
--	a.account_id  ,
	i.last_name as 'Last Name'
from product p
inner join account as a 
on p.product_cd = a.PRODUCT_CD
join individual i on a.cust_id = i.cust_id
order by a.account_id;
--
-- Q6
--
select
at.*
from
	acc_transaction as at
inner join account a on
	a.account_id = at.account_id
inner join individual i on
	a.cust_id = i.cust_id
where
	i.LAST_NAME like 'T%';


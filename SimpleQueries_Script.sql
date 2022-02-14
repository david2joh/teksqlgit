-- use db
use classicmodels;
--
-- Q1
--
select
	productName as 'Name',
	productLine as 'Product Line',
	buyPrice as 'Buy Price'
from
	products
order by
	buyPrice desc;
--
-- Q2
--
select
	contactLastName as 'Last Name',
	contactFirstName as 'First Name' ,
	City
from
	customers
where
	country = 'Germany'
order by 
	contactLastName;
--
-- Q3
--
select
	distinct(status) as Status
from
	orders
order by
	'Status'; 
--
-- Q4
--
select
	*
from
	payments
where
	paymentDate > '2005-01-01'
order by
	paymentDate;
--
-- Q5
--
select
	e.lastName as 'Last Name' ,
	e.firstName as 'First Name' ,
	e. email as 'Email' ,
	e.jobTitle as 'Job Tile'
from
	employees as e
inner join offices as o
		using(officeCode)
where
	o.city = 'San Francisco';
--
-- Q6
--
 select
	productName as 'Name' ,
	productLine as 'ProductLine',
	productScale as 'Scale',
	productVendor as 'Vendor'
from
	products
where
-- more precise would be to use:  IN ('Vintage Cars',Classic Cars')
	productLine like '%Cars'  
order by productLine desc,productName;
 
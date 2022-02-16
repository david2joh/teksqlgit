-- subqueries

-- find all customers located in USA and has average fcredit lkimit >= average in USA 
-- show highest purchase order (quantity ordered*priceeach) and product name

-- step one find average credit limit in usage 

use classicmodels;

-- average credit limit in usa
select avg(creditLimit) from customers where country = 'USA';
-- creditLimt > avg
select customerName , creditLimit
from customers
where country = 'USA'
 and creditLimit >= 
 (select avg(creditLimit) from customers where country = 'USA');
 -- second problem
select * from orderdetails o ;
select * from orders;
select * from products;
select customerName from customers where country = 'USA';
  -- show productName (not productcode) and highest PO sum(quantity*price), add custID as well
select o.customerNumber ,o.orderNumber , sum(od.quantityOrdered*od.priceEach) as `highest purchase` from orderdetails as od
join products as p on od.productCode = p.productCode 
join orders as o on od.orderNumber = o.orderNumber
group by od.orderNumber 
order by `highest purchase` desc;
--  ask about tick marks  forward tick didnt work
-- combine all this
--
select c.customerNumber as 'ID', c.customerName as 'Name' ,sss.productName  as 'Product Name' ,max(sss.`highest purchase`) as `highest purchase`
from customers as c
join 
(
select o.customerNumber ,o.orderNumber ,p.productName, sum(od.quantityOrdered*od.priceEach) as `highest purchase` from orderdetails as od
join products as p on od.productCode = p.productCode 
join orders as o on od.orderNumber = o.orderNumber
group by od.orderNumber 
order by `highest purchase` desc 
) sss on c.customerNumber = sss.customernumber
where c.creditLimit >= 
(select avg(creditLimit) from customers where country = 'USA') and country = 'USA'
group by c.customerNumber 
order by `highest purchase` desc
;

-- Jafer soln
select c.customernumber as `ID`, c.customername as `Customer`,sss.productname as `Product Name`, max(sss.`highest purchase`) as `Highest Purchase`
from customers as c 
join 
(
select o.customernumber,p.productname, o.ordernumber, sum(od.quantityordered*od.priceeach) as `highest purchase`
from orderdetails as od
join products as p on od.productcode = p.productcode 
join orders as o on od.ordernumber = o.ordernumber 
group by od.ordernumber
order by `highest purchase` desc
) as sss on c.customernumber = sss.customernumber 
where c.creditlimit >= 
(
select avg(creditLimit) from customers where country = 'USA'
) and c.country = 'USA'
group by c.customernumber 
order by `highest purchase` desc;




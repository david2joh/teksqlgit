use classicmodels;
--
-- Q1
--
select
	customerName, CONCAT(contactLastName, ' ',contactFirstName) as SalesRep
from
	customers
order by
	customerName;
--
-- Q2
-- 
select
	p.productName,
	SUM(od.quantityOrdered * od.priceEach),
	SUM(od.quantityOrdered),
	AVG(od.priceEach)
from
	orderdetails as od
	join products p where od.productCode = p.productCode 
group by
	od.productCode;
--
-- Q3 list order status and # of orders with that status as "Order Status" and "#orders"  sort by status
--
select
	status as "Order Status",
	count(orderNumber) as "#Orders"
from
	orders
group by
	status
order by
	status;
--
-- Q4  List for each product Line the total # of products sold from that product line . 
--     Label as "product Line and #Sold" , order by 2nd col descending"
--
select
	p.productLine as 'Product Line',
	Sum(od.quantityOrdered) as '#Sold'
from
	products p
join orderdetails od on
	p.productCode = od.productCode
	group by p.productLine 
	order by 2 desc;

 
--
-- Q5 
-- For each employee who represents customers , output the total # of orders that employee's customers have placed
-- alongside the total sale amount of those oreders. 
-- The employee names should be a single column labeled as "Sales Rep" fromatted as 'lastName firstName'.
-- The second column should be titled "#Orders" and the thirs "Total Sales" . Sort by "Total Sales descending" . 
-- Only (and all ) employees with the title "Sales Rep should be included in the oputput andif the employee 
-- made no sales the Total Sales should display as 0.0"
--	
--
-- select	e.employeeNumber ,	e.lastName ,	count(od.orderNumber)
;

--
select CONCAT(e.lastName,' ',firstName)  as 'Sales Rep' ,
FORMAT(if(SUM(od.quantityOrdered * od.priceEach),SUM(od.quantityOrdered * od.priceEach),0.00),2)  as `Total Sales`
from employees as e left join customers as c on e.employeeNumber = c.salesRepEmployeeNumber 
left join orders as o on c.customerNumber = o.customerNumber 
   left join orderdetails as od on o.orderNumber = od.orderNumber
where
	e.jobTitle = 'Sales Rep'  
    group by  e.employeeNumber   
    order by `Total Sales` desc;
   
--
-- Q6
-- Output the month name ,4-digit year, and total sales by month 
--
select MONTHNAME(o.orderDate) AS 'Month', YEAR(o.orderDate) AS 'Year' ,
Format(SUM(od.quantityOrdered * od.priceEach),2) as 'Payments Recieved'
from orders o 
join orderdetails as od on o.orderNumber = od.orderNumber
group by EXTRACT(YEAR_MONTH FROM orderDate) ;

--

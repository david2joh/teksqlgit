select * from orderdetails as od join orders as o on od.orderNumber = o.orderNumber 
join customers as c on o.customerNumber = c.customerNumber 
join employees as e on e.employeeNumber = c.salesRepEmployeeNumber 
where e.jobTitle = 'Sales Rep';
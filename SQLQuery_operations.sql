use W3Schools

select * from categories

select * from categories where CategoryName = 'Grains/Cereals'

select * from categories where
CategoryName = 'Grains/Cereals' or 
CategoryName = 'Beverages' or 
CategoryName = 'Seafood' or 
CategoryName = 'Produce'

select * from categories where
CategoryName in ('Grains/Cereals','Beverages','Seafood')

select * from customers

select * from customers where
Country in ('Germany','UK','France')

select count(*) from customers where
Country in ('Germany','UK','France')

select * from customers where
Country in ('Germany','UK','France') or
City in ('Madrid','Tsawassen')

select * from customers where
(Not Country in ('Germany','UK','France')) and
(Not City in ('Madrid','Tsawassen'))

select count(*) as 'count label' from customers where
(Not Country in ('Germany','UK','France')) and
(Not City in ('Madrid','Tsawassen'))

select * from customers where
CustomerName like 'A%' or CustomerName like 'B%' or CustomerName like 'W%' and
Country in ('Mexico','UK','Germany','France','Canada') order by CustomerName desc

select * from employees order by BirthDate
select top(5) * from employees order by BirthDate

select * from employees where year(birthdate) between 1928 and 1958 order by BirthDate

select * from order_details

select CustomerName,sum(order_details.Quantity) as 'Total' from customers
left join orders
On customers.CustomerID = orders.CustomerID
left join order_details
On orders.OrderID = order_details.OrderID
group by customers.CustomerName
having sum(order_details.Quantity) between 10 and 30

where month(OrderDate) between 07 and 08
and year(OrderDate) = 1996
order by OrderDate

select * from customers
left join orders
On customers.CustomerID = orders.CustomerID
where month(OrderDate) between 07 and 08
and year(OrderDate) = 1996
order by OrderDate

select sum(Quantity) as 'Total Quantity' from order_details 

-- will return any name which contains A
select * from customers where CustomerName like '%A%' 

-- will return any name which starts with A
select * from customers where CustomerName like 'A%' 

-- will return any name which has second character as A
select * from customers where CustomerName like '_A%'

-- will return any name which has 3rd character as A
select * from customers where CustomerName like '__A%'

select * from customers where
Country in ('UK') and
CustomerName like 'B%'

select * from customers where
CustomerName like '_%'

select * from customers where
Country in ('UK') and
CustomerName like '_%'

select distinct country from customers

select count(distinct country) from customers

select distinct * from customers

-- use desc for descending order
select * from customers order by ContactName asc


select * from customers order by Country asc, ContactName desc

-- to update a cell value in a table
update customers set ContactName = 'Hannah Moos' where CustomerID = 6

-- to get first n records
select top(10) * from customers
-- select top 10 * from customers (another syntax)
-- to get bottom 10, sort in desc and then fetch top 10

-- Aggregate function: Count, Min, Max, Avg, Sum

select * from products
select count(*) from products

select min(Price) from products
select max(Price) from products

select * from products order by Price asc

select sum(Price) as 'total price' from products

select avg(Price) from products -- Average through syntax
select sum(Price)/count(Price) as 'Average price' from products -- Average through calculation

-- show products from Price range 10 to 50 using and
select * from products where Price >9 and Price < 51 order by Price asc

-- show products from Price range 10 to 50 using between syntax
select * from products where Price between 10 and 50 order by Price

--- UNION (does not include duplicate values)
--1= Name String | Age Int | Addres String
--2= Addres String | Age Int | Name String
-- UNION is possible on the above scenario

--- UNION all (retains duplicate values)

select city, country from customers
UNION
select city, country from suppliers

select city, country from customers
UNION all
select city, country from suppliers

select city, country from customers where CustomerID > 90
UNION
select city, country from suppliers

select country,count(*) as 'customer count' from customers group by Country

-- use having (having always works on aggregate functions)
select Country,count(Country) as 'customer count' from customers group by Country
having count(CustomerID) > 5
order by count(Country)

--- select into
select * into newcustomers
from customers

select * from newcustomers

select * into newcustomers2
from customers
where CustomerID < 1

select * from newcustomers2

--- Only selected columns
select CustomerID,City,Country,ContactName into newcustomers3
from customers

select * from newcustomers3

--- Insert into
-- Insert into new_customers (this will not work since table 'new_customers' is not yet created) but
-- select into creates a table at runtime and inserts data

Insert into newcustomers2
select * from customers

--- saving output into a new table
select country, count(Country) as 'Country Count' into newcustomertable from customers group by Country
select * from newcustomertable where [Country Count] > 3 order by Country

--- CASE
select * from products

SELECT ProductID,ProductName,SupplierID,CategoryID,Unit,Price,
CASE
	when Price >= 1 and Price <= 20 Then 'Low'
	when Price >= 21 and Price <= 35 Then 'Medium'
	when Price >= 36 Then 'High'
End as PriceRange
into newproducts
	FROM products

select * from newproducts order by Price
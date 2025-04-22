-- A
select *
from CUSTOMER;
select * from ITEM;
select * from SALE; 
select * from SALE_ITEM;

-- B 
select LastName, FirstName, Phone 
from CUSTOMER;

-- C
select LastName, FirstName, Phone
from CUSTOMER
Where FirstName = "John";

-- D
select LastName, FirstName, Phone, SaleDate, Total
from CUSTOMER, SALE
where CUSTOMER.CustomerID = SALE.CustomerID 
and Total > 100.00;

-- E
 select LastName, FirstName, Phone
 from CUSTOMER 
 where FirstName like "D%";
 
/**F**/ 
select LastName, FirstName, Phone
from CUSTOMER
where LastName like "%ne%"; 

-- G 
select LastName, FirstName, Phone
from CUSTOMER
where Phone like "%_______56%";

-- H 
select max(Total), min(Total)
from SALE;

-- I
select avg(Total)
from SALE;

-- J
select Count(*)
from CUSTOMER;

-- K 
select *
from CUSTOMER
group by LastName;

-- L
select Count(*)
from CUSTOMER
order by LastName, FirstName;

-- M
select LastName, FirstName, Phone
from CUSTOMER
where CustomerID in (
	select CustomerID 
	from SALE 
	where Total > 100.00
)
order by LastName asc, FirstName desc;

-- N
select LastName, FirstName, Phone
from CUSTOMER, SALE
where Total > 100.00
order by LastName asc, FirstName desc;


-- O 
select distinct LastName, FirstName, Phone 
from CUSTOMER join SALE
on Total > 100.00
order by LastName asc, FirstName desc;

-- P 
select LastName, FirstName, Phone
from CUSTOMER
where CustomerID in (
	select CustomerID 
    from SALE
    where SaleID in (
			select SaleID 
			from SALE_ITEM
			where itemID in (
				select itemID 
				from ITEM
				where ItemDescription = "Desk Lamp"
						)
)
)
order by LastName asc, FirstName desc;

-- Q 
select distinct LastName, FirstName, Phone
from CUSTOMER, SALE
where CUSTOMER.CustomerID = SALE.CustomerID
order by LastName asc, FirstName desc;



use lagos_ride_analytics_database;

-- 1

CREATE TABLE Top_5_Highest_Rated_Drivers_In_Lagos AS
select DriverID, Name, Rating 
from DRIVERS
order by Rating desc
LIMIT 5;

select * 
from Top_5_Highest_Rated_Drivers_In_Lagos;

-- 2

create table Top_Riders_With_More_Than_5_Rides as -- 
select distinct RiderID, Name
from RIDERS 
where RiderID in (
	select RiderID 
    from RIDES
    group by RiderID
    having count(RiderID) > 5
    );

-- 3
create table Total_Revenue_For_Past_Month as 
select SUM(Amount) as Total_Revenue
from PAYMENTS;

-- 4
create table Number_Of_Rides_Per_Area as 
select City as Area, count(City) as Frequency
from RIDERS, RIDES
where RIDERS.RiderID = RIDES.RiderID
group by City
order by count(City) desc;

create table Area_With_Most_Rides as
select *
from Number_Of_Rides_Per_Area
where Frequency = (
	select max(Frequency) 
    from Number_Of_Rides_Per_Area);

-- 5

-- create table Highest_Revenue_Driver as-- 
select DriverID, Name, sum(Fare)
from DRIVERS join RIDES
on DRIVERS.DriverID = RIDES.DriverID;




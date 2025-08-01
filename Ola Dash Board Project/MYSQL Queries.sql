Create Database Ola;
Use Ola;

# 1. Retrieve all successful bookings: 
CREATE VIEW Successful_bookings AS
SELECT * FROM Bookings
WHERE Booking_Status = 'Success';

Select * From Successful_bookings;

# 2. Find the average ride distance for each vehicle type:
Create View ride_distance_for_each_vehicle AS
select vehicle_type, avg(Ride_Distance)
as avg_distance from Bookings
group by Vehicle_Type;

Select * from ride_distance_for_each_vehicle;

# 3. Get the total number of cancelled rides by customers:
create view cancel_by_customer as
select count(*) from Bookings
where Booking_Status = "Canceled by Driver";

select * from cancel_by_customer;
# 4. List the top 5 customers who booked the highest number of rides:
Create View top_5_customerss as
select Customer_ID, count(Booking_ID) as total_rides
from Bookings 
group by Customer_ID 
order by total_rides desc limit 5;

select * from top_5_customerss;
# 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view rides_cancelled as
select count(*) from Bookings as cancel_count
where (Booking_Status="Canceled by Driver")  and (Canceled_Rides_by_Driver = "Personal & Car related issue");

select * from rides_cancelled;

# 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view max_min_driver_rate as
select max(Driver_Ratings) as max_ratings,
min(Driver_Ratings) as min_ratings from Bookings where (Vehicle_Type="Prime Sedan");

select * from max_min_driver_rate; 

# 7. Retrieve all rides where payment was made using UPI:
create view payment as
select * from Bookings where (Payment_Method="UPI");

select * from payment;

# 8. Find the average customer rating per vehicle type:
create view average_customer_rating as
select Vehicle_Type, avg(Customer_Rating) as average_customer_ratings
from Bookings 
group by Vehicle_Type;

select * from average_customer_rating;
# 9. Calculate the total booking value of rides completed successfully:
create view total_booking_value_of_rides_completed_successfully as
select Booking_Status, sum(Booking_Value)
from Bookings where Booking_Status="Success" 
group by Booking_Status;

select * from total_booking_value_of_rides_completed_successfully;


# 10. List all incomplete rides along with the reason:
create view incomplete_reason as
select Incomplete_Rides,Incomplete_Rides_Reason from Bookings
where Incomplete_Rides="Yes";

select * from incomplete_reason;

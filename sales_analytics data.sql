CREATE DATABASE Sales_analyst;
use sales_analyst;
create table sales(
transaction_id int primary key,
sale_date date, 
sale_time time, 
customer_id int, 
gender varchar(10), 
age int, 
category varchar(20), 
quality int, 
price_per_unit int, 
cogs int , 
total_sales int
);

select * from sales;
select count(*) from sales;



# how many male and female customers are :
select gender, count(gender) as Counts from sales
group by gender;

#we have three type of categories: 
select distinct category, count(category) as counts from sales
group by category;
 
# avg age of customer who purchase from this store
select round(avg(age), 0) as Average_age from sales;

# how many unique customer we have . 
select count( distinct customer_id) from sales;
 
select count(distinct customer_id) from sales;

select * from sales
where sale_date = '2022-11-05';

select count(sale_date) from sales
where sale_date = '2022-11-05';

select * from sales
where category = "Clothing"
and 
to_char(sale_date, "YYYY-MM") = "2022-11" 
AND 
quality >=4
 ;


SELECT * 
FROM sales
WHERE category = 'Clothing'
  AND TO_CHAR(sale_date, 'YYYY-MM') = '2022-11' # to_char in not exist in mysql work bench. 
  AND quality >= 4;


SELECT * 
FROM sales
WHERE category = 'Clothing'
  AND DATE_FORMAT(sale_date, '%Y-%m') = '2022-11' # date_format
  AND quality >= 4;


select  distinct category, sum(total_sales) as Total_sale from sales
group by category;

select round(avg(age),0) AS Avg_age from sales; 

select * from sales
where total_sales >1000;

select gender, count(transaction_id) from sales
group by gender;

select category, count(transaction_id) from sales
group by category;

# categorise the data 
select Category, Gender, count(*) as total_trans
from sales
group by 
category, gender;


# retrive the Avg sales of data from each month and each year and find which month and year is the best .
select year(sale_date) as YEAR_,  month(sale_date) AS MONTH_ , round(avg(total_sales), 2) as Average_Sales
from sales
group by 1,2
order by 1,2;
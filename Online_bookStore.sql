use library;
select * from customers;
select * from orders;
select * from books;

#1) retrive all books in the "fiction" genre
select * from books
where Genre = "Fiction";

# 2) finds books published after the year 1950
select * from books
where Published_Year > 1950;

#3) list all customer from canada
select * from customers
where country = 'canada';

#4) show orders placed on nov 2023
select * from orders
where order_date between '2023-11-01' and '2023-11-30';

#5) Retrive the total book stock avaiable. 
select sum(stock) from books;

#6) Find the details of most expensive book
select * from books
order by price desc
limit 5;

#7) show customer who order more than one quantity of a book
select * from orders
where Quantity > 1;

#8) Retrive all order where the total amount exceed 20 dollar
select * from orders
where total_amount >20
order by total_amount desc
limit 3;

#9) List all Genre available in books 
select distinct Genre from books;

#10) find the book with the lowest stock 
select * from books
order by stock asc
limit 5;

#11) Calculate total revenue generated from all books 
select round(sum(total_amount), 2) as total_revenue from orders;

#12) Retrive the total no. of books for each genre. 
select Genre, sum(stock) as Total_no_of_books from books
group by Genre;

select b.Genre, sum(o.Quantity) as total_book_sold
from orders o
join books b on o.book_id = b.book_id
group by b.Genre;

select * from orders;



#13) find the avg price of book in fantacy genre
select round(avg(price), 2) as avg_fantasy_price from books
where Genre = 'fantasy';

#14) list of customers who have orders atleast 2 books
select customer_id, count(order_id) as Order_count
from orders
group by customer_id
having count(order_id)>= 2;

#15) find the most frequently ordered book
select b.book_id, b.title,  count(o.order_id) as order_count
from orders o 
join books b on b.book_id = o.book_id
group by b.book_id, b.title
order by order_count desc
limit 5;


create database sales_management_system;
use sales_management_system;

create table sales_transactions (
transaction_id int primary key not null,
transaction_date date,
customer_id int, foreign key (customer_id) references customer_info (customer_id),
product_id int, foreign key (product_id) references product_details (product_id), 
quantity_sold int not null,
total_amount decimal(5,2));

insert into sales_transactions values
(1, '2024-01-18', 201, 101, 5, 550.00),
(2, '2024-03-18', 202, 102,  3, 350.00),
(3, '2024-02-17', 203, 103,  2, 400.00),
(4, '2024-03-17', 204, 104,  6, 575.00),
(5, '2024-03-16', 205, 105,  7, 820.00),
(6, '2024-02-16', 206, 106,  3, 300.00),
(7, '2024-03-15', 207, 107,  2, 390.00),
(8, '2024-03-15', 208, 108, 2, 200.00),
(9, '2024-02-14', 209, 109, 9, 995.00),
(10, '2024-03-14', 210, 110, 4, 500.00),
(11, '2024-01-13', 211, 111, 3, 350.00),
(12, '2024-03-13', 212, 112, 7, 900.00),
(13, '2024-03-12', 213, 113, 4, 600.00),
(14, '2024-03-12', 214, 114, 8, 990.00),
(15, '2024-03-11', 215, 115, 3, 90.00);

create table customer_info (
customer_id int primary key not null,
customer_name varchar(45),
email varchar(50),
address varchar(60));

insert  into customer_info values
(201, 'hassan idris', 'hidris4real@gmail.com', '23A Adeola Odeku Street, Victoria Island, Lagos'),
(202, 'dapo adeshina', 'dapoade@gmail.com', '7B Allen Avenue, Ikeja, Lagos' ),
(203, 'qudus ayuba', 'ayuba@gmail.com', '15B Ligali Ayorinde Street, Victoria Island, Lagos' ),
(204, 'rabiu ridwan', 'rabiu@gmail.com', '42A Awolowo Road, Ikoyi, Lagos' ),
(205, 'ifeoluwa shodiya', 'shodiya@gmail.com', '9C Opebi Road, Ikeja, Lagos' ),
(206, 'oluwafemi samuel', 'oluwafemi@gmail.com', '18D Marina Street, Lagos Island, Lagos'),
(207, 'adewole oyemade', 'oyemade@gmail.com', '3E Adeyemo Alakija Street, Victoria Island, Lagos'),
(208, 'adewale oyeyemi', 'oyeyemi@gmail.com', '55F Adeniyi Jones Avenue, Ikeja, Lagos' ),
(209, 'aliyu hammed', 'aliyu@gmail.com', '12G Bourdillon Road, Ikoyi, Lagos'),
(210, 'shola shittu', 'shittu@gmail.com', '30H Toyin Street, Ikeja, Lagos'),
(211, 'opeyemi abe', 'abe@gmail.com', '8I Ribadu Road, Ikoyi, Lagos'),
(212, 'rejoice lee', 'olee@gmail.com', '21J Adekunle Fajuyi Way, GRA Ikeja, Lagos'),
(213, 'akin idris', 'akin@gmail.com', '6K Ozumba Mbadiwe Avenue, Victoria Island, Lagos'),
(214, 'owolabi dada', 'dada@gmail.com', '10L Olu Holloway Road, Surulere, Lagos'),
(215, 'tosin favour', 'tosin@gmail.com', '4M Ajose Adeogun Street, Victoria Island, Lagos');

create table product_details (
product_id int primary key not null,
product_name varchar(50),
category varchar(50),
price decimal(5,2));

insert into product_details values
 (101, 'Stellar Backpack', 'Bags', 500.00),
 (102, 'banana', 'fruits', 127.50),
 (103, 'Tech Savvy Laptop', 'Electronics', 210.00),
 (104, 'Organic Green Tea', 'Beverages', 120.00),
 (105, 'Cozy Cashmere Sweater', 'Clothing', 850.00),
 (106, 'Fresh Farm Eggs', 'Groceries',  8.00),
 (107, 'Diamond Stud Earrings', 'Jewelry',  450.00),
 (108, 'Rings', 'Jewelry', 350.00),
 (109, 'Floral Print Dress', 'Clothing', 67.50),
 (110, 'Gourmet Chocolate Box', 'Food & Snacks', 35.00),
 (111, 'jeans', 'clothing', 200.00),
 (112, 'Rechargeable Flashlight', 'Tools & Home Improvement', 15.00),
 (113, 'Artisanal Hand Soap', 'Health & Beauty', 10.00),
 (114, 'Smart Home Security Camera', 'Home & Kitchen', 150.00),
 (115,'apple', 'fruits', 25.00);


-- Adding a new sales transaction to the system.
insert into sales_transactions values
(16, '2024-04-11', 214, 112, 3, 90.00);

-- Updating the product associated with a sales transaction.
UPDATE Sales_Transactions
SET Product_ID = 111
WHERE Transaction_ID = 15;

insert into customer_info values
(216, 'owolabi yahyah', 'yaya@gmail.com', '19f Olu Holloway Road, Surulere, Lagos');

-- Finding the total number of sales transactions for each product category.
SELECT p.Category, COUNT(st.Transaction_ID) AS TotalTransactions
FROM Product_details p
JOIN Sales_Transactions st
 ON p.Product_ID = st.Product_ID
GROUP BY p.Category;

-- Retrieving the names of customers who made purchases in a specific month.
select c.customer_name from customer_info c
join sales_transactions st
on c.customer_id = st.customer_id
where st.transaction_date between '2024-03-01' and '2024-03-31';
-- where month(st.transaction_date) = 3






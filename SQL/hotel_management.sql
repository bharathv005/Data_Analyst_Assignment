create database hotel_managementdb;
use hotel_managementdb;
create table users(
user_id varchar(50) primary key,
name varchar(100),
phone_number varchar(15),
mail_id varchar(100),
billing_address varchar(255)
);

create table bookings(
booking_id varchar(50) primary key,
booking_date datetime,
room_no varchar(50),
user_id varchar(50),
foreign key(user_id) references users(user_id)
);

create table items(
item_id varchar(50) primary key,
item_name varchar(100),
item_rate decimal(10,2)
);

create table booking_commercials(
id varchar(50) primary key,
booking_id varchar(50),
bill_id varchar(50),
bill_date datetime,
item_id varchar(50),
item_quantity decimal(10,2),
foreign key(booking_id) references bookings(booking_id),
foreign key(item_id) references items(item_id)
);

insert into users values
('21wrcxuy-67erfn','john doe','9700000001','john.doe@example.com','12, street a, delhi'),
('21wrcxuy-67erfx','jane smith','9700000002','jane.smith@example.com','34, street b, mumbai'),
('21wrcxuy-67erfy','bob ray','9700000003','bob.ray@example.com','56, street c, chennai');

insert into items values
('itm-a9e8-q8fu','tawa paratha',18.00),
('itm-a07vh-aer8','mix veg',89.00),
('itm-w978-23u4','paneer curry',150.00),
('itm-b123-cd45','cold coffee',60.00),
('itm-e456-fg78','fried rice',120.00);

insert into bookings values
('bk-09f3e-95hj','2021-09-23 07:36:48','rm-bhf9-aerjn','21wrcxuy-67erfn'),
('bk-09f3e-95hk','2021-10-05 10:00:00','rm-bhf9-aerjm','21wrcxuy-67erfx'),
('bk-09f3e-95hl','2021-10-15 14:00:00','rm-bhf9-aerjo','21wrcxuy-67erfy'),
('bk-09f3e-95hm','2021-11-01 09:00:00','rm-bhf9-aerjp','21wrcxuy-67erfn'),
('bk-09f3e-95hn','2021-11-20 11:00:00','rm-bhf9-aerjq','21wrcxuy-67erfx'),
('bk-09f3e-95ho','2021-12-10 08:00:00','rm-bhf9-aerjr','21wrcxuy-67erfy');

insert into booking_commercials values
('q34r-3q4o8-q34u','bk-09f3e-95hj','bl-0a87y-q340','2021-09-23 12:03:22','itm-a9e8-q8fu',3),
('q3o4-ahf32-o2u4','bk-09f3e-95hj','bl-0a87y-q340','2021-09-23 12:03:22','itm-a07vh-aer8',1),
('134lr-oyfo8-3qk4','bk-09f3e-95hk','bl-34qhd-r7h8','2021-10-05 13:00:00','itm-w978-23u4',5),
('134lr-oyfo8-3qk5','bk-09f3e-95hk','bl-34qhd-r7h8','2021-10-05 13:00:00','itm-e456-fg78',4),
('134lr-oyfo8-3qk6','bk-09f3e-95hl','bl-34qhd-r7h9','2021-10-15 15:00:00','itm-b123-cd45',2),
('134lr-oyfo8-3qk7','bk-09f3e-95hl','bl-34qhd-r7h9','2021-10-15 15:00:00','itm-a9e8-q8fu',3),
('134lr-oyfo8-3qk8','bk-09f3e-95hm','bl-34qhd-r7i0','2021-11-01 10:00:00','itm-w978-23u4',3),
('134lr-oyfo8-3qk9','bk-09f3e-95hm','bl-34qhd-r7i0','2021-11-01 10:00:00','itm-a07vh-aer8',2),
('134lr-oyfo8-3qka','bk-09f3e-95hn','bl-34qhd-r7i1','2021-11-20 12:00:00','itm-e456-fg78',6),
('134lr-oyfo8-3qkb','bk-09f3e-95hn','bl-34qhd-r7i1','2021-11-20 12:00:00','itm-b123-cd45',3),
('134lr-oyfo8-3qkc','bk-09f3e-95ho','bl-34qhd-r7i2','2021-12-10 09:00:00','itm-a9e8-q8fu',10),
('134lr-oyfo8-3qkd','bk-09f3e-95ho','bl-34qhd-r7i2','2021-12-10 09:00:00','itm-w978-23u4',2);
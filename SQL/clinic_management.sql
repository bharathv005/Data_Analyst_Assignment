create database clinic_management;
use clinic_management;
create table clinics(
cid varchar(50),
clinic_name varchar(100),
city varchar(50),
state varchar(50),
country varchar(50)
);

create table customer(
uid varchar(50),
name varchar(100),
mobile varchar(20)
);

create table clinic_sales(
oid varchar(50),
uid varchar(50),
cid varchar(50),
amount float,
datetime datetime,
sales_channel varchar(50)
);

create table expenses(
eid varchar(50),
cid varchar(50),
description text,
amount float,
datetime datetime
);

insert into clinics(cid,clinic_name,city,state,country)
values
('c1','alpha health','bangalore','karnataka','india'),
('c2','beta care','mysore','karnataka','india'),
('c3','kappa clinic','hubli','karnataka','india'),
('c4','gamma clinic','chennai','tamil nadu','india'),
('c5','delta wellness','coimbatore','tamil nadu','india'),
('c6','sigma health','madurai','tamil nadu','india'),
('c7','epsilon med','hyderabad','telangana','india'),
('c8','zeta life','warangal','telangana','india'),
('c9','omega care','nizamabad','telangana','india');

insert into customer(uid,name,mobile)
values
('u1','bharath','98xxxxxxx1'),
('u2','ananya r','98xxxxxxx2'),
('u3','chetan s','98xxxxxxx3'),
('u4','deepa m','98xxxxxxx4'),
('u5','eshwar k','98xxxxxxx5'),
('u6','farhan a','98xxxxxxx6'),
('u7','gowri p','98xxxxxxx7'),
('u8','harish l','98xxxxxxx8'),
('u9','indu j','98xxxxxxx9'),
('u10','javed h','98xxxxxx10'),
('u11','kiran b','98xxxxxx11'),
('u12','lata g','98xxxxxx12');

insert into clinic_sales(oid,uid,cid,amount,datetime,sales_channel)
values
('o1','u1','c1',27000,'2021-01-05 10:00:00','online'),
('o2','u2','c2',13000,'2021-01-10 11:00:00','offline'),
('o3','u3','c3',18000,'2021-01-15 12:00:00','direct'),
('o4','u4','c4',25000,'2021-01-05 10:00:00','direct'),
('o5','u5','c5',10000,'2021-01-10 11:00:00','online'),
('o6','u6','c6',16000,'2021-01-15 12:00:00','offline'),
('o7','u7','c7',30000,'2021-01-05 10:00:00','offline'),
('o8','u8','c8',20000,'2021-01-10 11:00:00','online'),
('o9','u9','c9',12000,'2021-01-15 12:00:00','direct'),
('o10','u10','c1',11000,'2021-03-01 10:00:00','online'),
('o11','u11','c4',9000,'2021-03-10 12:00:00','offline'),
('o12','u12','c7',4000,'2021-03-20 14:00:00','direct');

insert into expenses(eid,cid,description,amount,datetime)
values
('e1','c1','supplies',2000,'2021-01-05 09:00:00'),
('e2','c2','maintenance',1500,'2021-01-10 09:00:00'),
('e3','c3','rent',5000,'2021-01-15 09:00:00'),
('e4','c4','salaries',5000,'2021-01-05 09:00:00'),
('e5','c5','equipment',4000,'2021-01-10 09:00:00'),
('e6','c6','marketing',3000,'2021-01-15 09:00:00'),
('e7','c7','utilities',8000,'2021-01-05 09:00:00'),
('e8','c8','supplies',7000,'2021-01-10 09:00:00'),
('e9','c9','maintenance',2000,'2021-01-15 09:00:00'),
('e10','c1','utilities',3000,'2021-03-01 09:00:00'),
('e11','c4','supplies',2500,'2021-03-05 09:00:00');
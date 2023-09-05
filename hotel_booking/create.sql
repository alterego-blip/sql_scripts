drop database if exists hotel;
create database hotel;

use hotel;

create table rooms (
  typeID int primary key auto_increment,
  accType varchar(40),
  sleeps int,
  price int
);


create table bill (
  billID int primary key auto_increment,
  dob date,
  name varchar(20),
  noa int,
  tnoc int,
  accTypeID int, 
  nor int,
  total int,
  foreign key(accTypeID) references rooms(typeID)
);

alter table rooms auto_increment=111;
alter table bill auto_increment=101;

insert into rooms (accType, sleeps, price) values
('Deluxe Suite', 2, 7999),
('Presidential Suite', 2, 9799),
('Deluxe Family Suite', 4, 18999),
('Villa with Private Pool', 6, 28499);

insert into bill (dob, name, noa, tnoc, accTypeID, nor) values
('2021-12-12', 'Rayan', 6, 5, 111, 3),
('2020-03-10', 'Sneha', 4, 1, 113, 1),
('2021-08-11', 'Akhil', 5, 2, 114, 1),
('2020-04-03', 'Aparna', 4, 3, 111, 2),
('2021-07-09', 'Rahul', 11, 4, 113, 2),
('2021-08-07', 'James', 3, 0, 113, 1);



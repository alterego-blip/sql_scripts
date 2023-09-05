drop database if exists dis;
create database dis;

use dis;

create table discount (
  category varchar(20),
  discount int check(discount <= 100)
);

create table customer (
  cid int primary key auto_increment,
  name varchar(20),
  dop date,
  category varchar(20),
  price int,
  pad int
);

alter table customer auto_increment=121;

insert into discount values
('Men', 25),
('Ladies', 30),
('Kids', 35);

insert into customer(name, dop, category, price) values
('Avanthika', '2022-12-12', 'Kids', 1200),
('Gregory', '2020-09-11', 'Men', 2500),
('Sara', '2021-04-02', 'Ladies', 3000),
('Ajay', '2021-07-09', 'Men', 1000);

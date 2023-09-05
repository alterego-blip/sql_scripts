drop database if exists marks;
create database marks;

use marks;

create table grace_marks (
  category varchar(4),
  graceMark int
);

create table student_details (
  srno int primary key auto_increment,
  studentName varchar(30),
  doa date,
  category varchar(4),
  totalMarks int check(totalMarks <= 350),
  finalMarks int,
  grade char
);

insert into grace_marks 
values ('NSS', 10),
('NCC', 15),
('ARTS', 5);

insert into student_details (studentName, doa, category, totalMarks)
values ('ANU', '2023-05-01', 'NSS', 280),
('ATHIRA', '2022-07-04', 'NCC', 250),
('ROHIT', '2023-07-06', 'ARTS', 270),
('ARUN', '2023-06-08', null, 300);

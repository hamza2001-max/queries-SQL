--Task-1
--Create a table STUDENT with following schema: (s_id, F_name, S_name, Sex, s_city,
--S_phone, DeptID, cgpa)
create table student (
    s_id varchar(6),
    fname varchar(15),
    sname varchar(15),
    sex number(1),
    s_city varchar(20),
    s_phone number(10),
    cgpa float(4)
);

--1.1. Change the data type of SEX from INTEGER to CHAR.
alter table student modify sex char;

--1.2. Change the name of Column /field SEX to GENDER.
alter table student rename column sex to gender;

--1.3. Insert Minimum 5 Rows in the Table.
insert into student values('1', 'Hamza', 'Ali', 'M', 'Peshawar', 1234567890, 3.5);
insert into student values('2', 'John', 'Doe', 'M', 'Washington', 09867654321, 3.2);
insert into student values('3', 'Ali', 'Khan', 'M', 'Peshawar', 03398428222, 7.9);
insert into student values('4', 'Ahmed', 'Khan', 'M', 'Mardan', 05535567890, 3.6);
insert into student values('5', 'Sarah', 'Gates', 'F', 'Boston', 1234565368, 3.6);

--1.4. Display All data inserted in the table.
select * from student;

--1.5. Add a new column; DOB of type DATE to the existing STUDENT relation.
alter table student add DOB date;

--1.6. Modify the column width of the F_name field of STUDENT table from 15 to 20.
alter table student modify fname varchar(20);

--1.7. Update all the existing records with DOB in the table.
update student set DOB = '01-Feb-2002' where DOB is null;

--1.8. Display the number of student from the student table who are from city ”Peshawar” and
--having cgpa more then 7.5.
select count(s_id) from student where s_city = 'Peshawar' and cgpa > 7.5;

--1.9. Display the number of student from the student table who are from city ”Mardan” or
--having cgpa less then 7.5.
select count(s_id) from student where s_city = 'Mardan' or cgpa < 7.5;

--1.10. Count the total number of students from the student table.
select count(s_id) from student;

--1.11. the total number of students from the student table who belong to either City ”Peshawar” or
--”Mardan”.
select count(s_id) from student where s_city = 'Peshawar' or s_city = 'Mardan';

--Task-2
--1. Create table for FACULTY data with below specification
create table faculty (
    f_id varchar2(6) primary key check (f_id like 'S%'),
    fname varchar2(20) not null,
    sname varchar2(20) not null,
    city varchar2(20),
    state varchar2(20),
    pin number(6),
    salary number(8,2) not null check (salary <> 0),
    deptID varchar(6)
);

--2. Create Table for COURSE data with below specifications.
create table course (
    course_id varchar2(6) primary key check (course_id like 'C%'),
    course_name varchar2(20) not null,
    credit number(1) not null check (credit <> 0),
    teach_hours number(2,2) not null check (teach_hours <> 0)
);

--3. Create table for DEPARTMENT data with below specifications.
create table department(
    d_id varchar2(6) primary key check(d_id like 'S%'),
    dname varchar2(20) not null,
    head varchar2(20) not null,
    address varchar2(20) not null,
    phone number(10),
    starton number(8, 2) not null check(starton <> 0),
    course varchar2(20) not null,
    foreign key (head) references faculty(f_id)
);

--4. Modify the table STUDENT with below specifications.
--4.1. Add constraint to DOB check(DOB &lt; 2010)
alter table student add constraint DOB check (DOB < '01-JAN-2010');
--4.2. Add constraint to S_ID, CGPA are NOT NULL
alter table student add constraint s_id check(s_id <> null);
alter table student add constraint cgpa check(cgpa <> null);
--4.3. Add constraint to S_ID to be UNIQUE and set it as PRIMARY KEY
alter table student add constraint unique_sid unique(s_id);
alter table student add constraint pk_id primary key(s_id);
--4.4. Add a new Column COURSE_ID and apply constraint REFRENCE to COURSE table
alter table student add course_id varchar2(6);
--4.5. Add constraint to COURSE_ID as FOREIGEN KEY
alter table student add constraint course_id foreign key(course_id) references course(course_id);

--Task3
--1. Write a query to display the CGPA of students whose DOB is &lt;= 2000 - 01 - 01 AND CGPA
--&gt;= 8.5 from STUDENT table.
update student set dob = '01-JAN-1990' where DOB is null;
select * from student where DOB <= '01-JAN-2000' and cgpa >= 8.5;
--2. Write a query to find the CGPA of a student whose DOB is &lt;= 2000 - 01 - 01 OR CGPA &gt;=
--8.5 from STUDENT table.
select * from student where DOB <= '01-JAN-2000' or cgpa >= 8.5;
--3. Write a query to find the student details who resides in “IN” Peshawar or Mardan.
select * from student where s_city in ('Peshawar', 'Mardan');
--4. Write a query to find the student details who resides in “NOT IN” Charsadda or Peshawar.
select * from student where s_city not in ('Peshawar', 'Charsadda');
--5. Write a query to find the student details whose cgpa in BETWEEN 8.5 and 9.5.
select * from student where cgpa between 9.5 and 8.5;
--6. Write a query to view the CGPA of students whose second letter in name is “a”.
select cgpa from student where sname like '_a%';
select * from student;
--7. Write a query to view the list of students in order of their CGPA.
select * from student order by cgpa desc;
--8. Delete record of student with sid is CS03
delete student where s_id = '3';
--9. Change the city of students with sid is CS04 to Abbotabad
update student set s_city = 'Abbotabad' where s_id = '4';
--10. Insert a new column named “percent” and store corresponding CGPAs in per cent by
--multiplying with 100.
alter table student add percent number;
update student set percent = cgpa*100 where percent is null;

-- Jacob Johnson
--Chapter 3

--1.

create table category
(catcode char(2),
 catdesc varchar2(10)
);

--2.

create table employees
(emp#      number(5,0),
 lastname  varchar2(36),
 firstname varchar2(36),
 job_id    varchar2(4)
);

--3.
alter table employees
 add (EmpDate DATE DEFAULT SYSDATE, EndDate DATE);
 
--4.
Alter table employees
 modify job_id varchar2(2);
 
--5.
alter table employees
 drop column EndDate;
 
--6.
rename employees
 to JL_EMPS;
 
--7.
create table BOOK_PRICING
 AS (SELECT ISBN "ID", COST, RETAIL, CATEGORY FROM BOOKS);
 
--8.
alter table BOOK_PRICING
 SET UNUSED (Category);
 
Desc BOOK_PRICING;
 
--9.
TRUNCATE TABLE
 BOOK_PRICING;

--10.
DROP TABLE BOOK_PRICING
 PURGE;
 
DROP TABLE JL_EMPS;

FLASHBACK TABLE
JL_EMPS
TO BEFORE DROP;
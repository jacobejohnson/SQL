/*Jacob Johnson
Chapter 10
4/2/2018
jejohnson8@dmacc.edu*/

--1.
SELECT INITCAP (firstname) "First Name", INITCAP (lastname)"Last Name"
FROM customers;

--2.
SELECT customer#,
NVL2(referred, 'REFERRED', 'NOT REFERRED')"WAS REFERRED?"
FROM customers;

--3.
SELECT b.title, TO_CHAR(oi.quantity*oi.paideach - (b.cost + o.shipcost), '$999.99') "Profit"
FROM orders o JOIN orderitems oi ON o.order#=oi.order#
              JOIN books b ON oi.isbn=b.isbn
WHERE o.order# = 1002;

--4.
SELECT title, CONCAT(ROUND(retail*100.0/cost - 100, 0),'%') "Markup"
FROM books;

--5.
SELECT current_timestamp
FROM dual;

--6.
SELECT title, LPAD(cost, 12, '*')
FROM books;

--7.
SELECT DISTINCT LENGTH (isbn)
FROM books;

--8.
SELECT title, pubdate, current_timestamp, TRUNC(MONTHS_BETWEEN(SYSDATE,pubdate), 0) AGE
FROM books;

--9.
SELECT NEXT_DAY(SYSDATE, 'WEDNESDAY')
FROM DUAL;

--10.
SELECT customer#, INSTR(customer#, '3') "FIRST 3", SUBSTR(zip, -3, 2)
FROM customers;

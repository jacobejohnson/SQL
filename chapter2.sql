--Jacob Johnson 1/26/18
--1.
SELECT *
 FROM Books;
--2.
SELECT title
 FROM Books;
--3.
SELECT title, pubdate "Publication Date"
 FROM BOOKS;
--4.
SELECT Customer#, City, State
 FROM CUSTOMERS;
--5.
SELECT Name, Contact AS "Contact Person", Phone
 FROM PUBLISHER;
--6. 
SELECT DISTINCT category
 FROM books;
--7.
SELECT DISTINCT Customer#
 FROM ORDERS;
--8.
SELECT category, title
 FROM BOOKS;
--9.
SELECT Lname || ', ' || Fname
 FROM AUTHOR;
--10.
SELECT Order#, Item#, ISBN, Quantity, PaidEach, Quantity*PaidEach "Item Total"
 FROM ORDERITEMS;
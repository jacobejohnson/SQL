--Jacob Johnson
--Chapter 09
--3/20/2018

--1.
SELECT b.title, p.contact, p.phone 
FROM books b JOIN publisher p ON b.pubid=p.pubid;

--2.
SELECT o.orderdate, c.firstname || ' ' || c.lastname "Customer Name"
FROM orders o JOIN customers c ON o.customer# = c.customer#
WHERE o.shipdate IS NULL
ORDER BY 1;

--3.
SELECT *
FROM customers c JOIN orders o ON c.customer#=o.customer#
                 JOIN orderitems oi ON o.order#=oi.order#
                 JOIN books b ON oi.isbn=b.isbn
WHERE c.state = 'FL' AND b.category = 'COMPUTER';

--4
SELECT DISTINCT b.title, c.firstname || ' ' || c.lastname "Customer Name"
FROM customers c JOIN orders o ON c.customer#=o.customer#
                 JOIN orderitems oi ON o.order#=oi.order#
                 JOIN books b ON oi.isbn=b.isbn
WHERE c.firstname = 'JAKE' AND c.lastname = 'LUCAS';

--5.
SELECT DISTINCT o.orderdate, b.title, c.firstname || ' ' || c.lastname "Customer Name", oi.paideach-o.shipcost "Profit"
FROM customers c JOIN orders o ON c.customer#=o.customer#
                 JOIN orderitems oi ON o.order#=oi.order#
                 JOIN books b ON oi.isbn=b.isbn
WHERE c.firstname = 'JAKE' AND c.lastname = 'LUCAS';
ORDER BY o.orderdate ASC, oi.paideach-o.shipcost DESC;

--6.
SELECT b.title, a.fname || ' ' || a.lname "Author"
FROM books b JOIN bookauthor ba ON b.isbn=ba.isbn
             JOIN author a ON ba.authorid=a.authorid
WHERE a.lname = 'ADAMS';

--7.
SELECT b.retail, b.title, b.discount, p.gift
FROM books b, promotion p
WHERE b.title = 'SHORTEST POEMS';

--8.
SELECT c.firstname, c.lastname, b.title, a.fname || ' ' || a.lname "Author"
FROM customers c JOIN orders o ON c.customer#=o.customer#
                 JOIN orderitems oi ON o.order#=oi.order#
                 JOIN books b ON oi.isbn=b.isbn
                 JOIN bookauthor ba ON b.isbn=ba.isbn
                 JOIN author a ON ba.authorid=a.authorid
WHERE c.firstname = 'BECCA' AND c.lastname= 'NELSON';

--9.
Select Title, Shipdate, State
From Customers, Orders, Books, Orderitems
Where customers.customer# = orders.order#
AND orders.order# = orderitems.order#
AND orderitems.isbn = Books.isbn;

--10.
SELECT e.empno, e.fname || ' ' || e.lname "Employee Name", m.fname ||' '|| m.lname "Manager Name"
FROM employees e, managers m
WHERE m.manager = e.empn(+);

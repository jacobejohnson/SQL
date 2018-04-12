--Jacob Johnson
--jejohnson8@dmacc.edu
--lab02

--1.
SELECT INITCAP (c.firstname) ||' '|| INITCAP (c.lastname) "Customer"
FROM customers c JOIN orders o ON c.customer#=o.customer#
                 JOIN orderitems oi ON o.order#=oi.order#
                 JOIN books b ON oi.isbn=b.isbn
WHERE c.state = 'WY' AND b.category = 'COOKING';

--2.
SELECT INITCAP(b.title) "Title", INITCAP (p.name) "Publisher", TO_CHAR(b.retail, '$999.00')"Retail Price"
FROM books b JOIN publisher p ON b.pubid=p.pubid
ORDER BY p.name, b.title;

--3.
SELECT DISTINCT b.isbn, INITCAP (b.title) "Title", INITCAP (p.name) "Publisher", INITCAP(pr.gift)"Gift"
FROM books b JOIN publisher p ON b.pubid=p.pubid, promotion pr
ORDER BY b.isbn;

--4.
SELECT o.order# "Order Number", TO_CHAR(o.orderdate, 'MON D, YYYY') "Order Date", c.customer# "Customer Number", c.firstname ||' '|| c.lastname "Customer"
FROM customers c, orders o
WHERE o.shipdate IS NULL
ORDER BY order#;

--5.
SELECT DISTINCT INITCAP(b.title) "Title", INITCAP(p.name)"Publisher" 
FROM books b, publisher p, bookauthor ba, author a
WHERE a.fname = 'WILLIAM' AND a.lname = 'WHITE'
ORDER BY 1;
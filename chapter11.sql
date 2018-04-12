--Jacob Johnson
--jejohnson8@dmacc.edu
--Chapter 11


--1.
select count(*) "Cooking Books?"
from books
where category='COOKING';

--2.
select count(*)"Books over $30"
from books
where retail > 30;

--3.
select to_char(max(b.pubdate), 'fmMonth dd, yyyy') "Most Recent Pub Date"
from orderitems oi join books b on oi.isbn=b.isbn;

--4.
select to_char(sum((oi.paideach-b.cost) * oi.quantity), '$999.00') "Profit"
from orders o join orderitems oi on o.order#=oi.order#
              join books b on oi.isbn=b.isbn
where o.customer#=1017;

--5.
select to_char(min(retail), '$999.00') "Cheapest Computer Book?"
from books
where category='COMPUTER';

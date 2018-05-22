--Jacob Johnson
--Lab03
--jejohnson8@dmacc.edu

--1.
select INITCAP(b.title) "Title", INITCAP(p.contact)"Contact"
from books b join publisher p on b.pubid=p.pubid
where p.name = 'PRINTING IS US'
order by b.title;

--2.
select DISTINCT INITCAP(title)"Cheapest Book", To_Char(cost, '$999.99')"Cost"
from books
where cost = (select min(cost)
            from books);

--3.
select INITCAP(title) "Title"
from books join bookauthor using(isbn)
            join author using (authorid)
where lname = 'PORTER' and fname = 'LISA';

--4.
select INITCAP(category)"Category", count(title)"Total", TO_CHAR(avg(retail), '$999.99')"Average",TO_CHAR(min(retail),'$999.99')"Lowest",TO_CHAR(max(retail), '$999.99')"Highest"
from books
group by category
order by avg(retail) desc;

--5.
select INITCAP(b.title)"Title", INITCAP(p.name)"Publisher"
FROM orderitems oi join books b using(isbn)
                    join publisher p using(pubid)
where oi.order# is null
order by 1;
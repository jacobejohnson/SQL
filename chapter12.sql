--Jacob Johnson
--Chapter 12
--jejohnson8@dmacc.edu

--1.
select title, retail
from books
where retail < (select avg(retail) from books);

--2.
select b.title, b.cost, b.category, a.avgcost
from books b join 
(select category, avg(cost) avgcost
from books
group by category) a on b.category=b.category
where b.cost < a.avgcost;

--3.
select order#, shipstate
from orders 
where shipstate = 
                (select shipstate
                from orderitems
                where order# = 1014);

--4.
select order#, 
        sum(quantity*paideach)
        from orderitems
        group by order#
        having sum (quantity*paideach) <
                                        (select sum(quantity * paideach)
                                        from orderitems
                                        where order# = 1008);
                                    
--5.
select initcap(a.fname || ' ' || a.lname)  "Author"
  from books b join bookauthor ba on b.isbn=ba.isbn
               join author a on ba.authorid=a.authorid
  where b.isbn = 
                  (select isbn
                     from orderitems
                    group by isbn
                   having count(order#) =
                                          (select max(count(order#))
                                             from orderitems
                                            group by isbn));

--6.
select title
from books
where category in(select distinct category
                    from books join orderitems using (isbn)
                    join orders using (order#)
                    where customer# = 1007)
                    and isbn not in(select isbn
                    from orders join orderitems using (order#)
                    where customer# = 1007);
--7.
select shipcity, shipstate
from orders
where shipdate-orderdate=
(select max(shipdate-orderdate)
from orders);

--8.
select customer#
from customers join orders using (customer#)
            join orderitems using (order#)
            join books using (isbn)
where retail =
            (select min(retail)
            from books);
            
--9.
select count(distinct customer#)
from orders join orderitems using(order#)
where isbn in
(select isbn
from orderitems join bookauthor using(isbn)
join author using(authorid)
where lname= 'AUSTIN'
and fname = 'JAMES');

--10.
select title
from books
where pubid = (select pubid
                from books
                where title = 'THE WOK WAY TO COOK');
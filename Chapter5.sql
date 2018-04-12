--Jacob Johnson
--Chapter 5

--1.
INSERT INTO Orders (Order#, Customer#, OrderDate)
 VALUES ('1021', '1009', '20-JUL-09');
 
--2.
UPDATE Orders
SET shipzip = '33222'
WHERE Order# = '1017';

--3.
Commit;

--4.
INSERT INTO Orders (Order#, Customer#, OrderDate)
VALUES ('1022', '2000', '06-AUG-09');

--Error starting at line : 17 in command -
--INSERT INTO Orders (Order#, Customer#, OrderDate)
--VALUES ('1022', '2000', '06-AUG-09')
--Error report -
--ORA-02291: integrity constraint (ORA530.ORDERS_CUSTOMER#_FK) violated - parent key not found
--HR.ORDERS_CUSTOMER#_FK did not match up with a private key. Need to either delete the foreign key or create
--a private key to match it.

--5.
INSERT INTO Orders (Order#, Customer#)
VALUES ('1023', '1009');
--Error starting at line : 29 in command -
--INSERT INTO Orders (Order#, Customer#)
--VALUES ('1023', '1009')
--Error report -
--ORA-01400: cannot insert NULL into ("ORA530"."ORDERS"."ORDERDATE")
--OrderDate cannot be NULL, this prompted the error message.

--6.
UPDATE Books
SET Cost
WHERE ISBN = '&ISBN';

--7.
UPDATE Books
SET cost = '20.00'
WHERE ISBN = '1059831198';

--8.
Rollback;

--9.
DELETE FROM orderitems
WHERE order# = '1005';
DELETE FROM orders
WHERE order# = '1005';

--10.
Rollback;




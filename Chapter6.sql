/*Jacob Johnson
Chapter 6 */

--1.
SELECT *
FROM customers;

CREATE SEQUENCE customers_customer#_seq
INCREMENT BY 1
START WITH 1021
NOCACHE NOCYCLE;

--2.
INSERT INTO customers (customer#, lastname, firstname, zip)
VALUES (customers_customer#_seq.NEXTVAL, 'SHOULDERS', 'FRANK', 23567);

--3.
CREATE SEQUENCE MY_FIRST_SEQ
INCREMENT BY -3
START WITH 5
MAXVALUE 5
MINVALUE 0
NOCYCLE;

--4.
SELECT MY_FIRST_SEQ.NEXTVAL
FROM dual;

SELECT MY_FIRST_SEQ.NEXTVAL
FROM dual;

SELECT MY_FIRST_SEQ.NEXTVAL
FROM dual;
--error on third select is due to the nextval going below the minvalue

--5.
ALTER SEQUENCE MY_FIRST_SEQ
MINVALUE -1000;

--6.
DROP TABLE email_log;

create table email_log
(emailid NUMBER(10),
emaildate DATE,
customer# NUMBER(10),
CONSTRAINT emailid_pk primary key (emailid));

INSERT INTO email_log
(emaildate, customer#)
VALUES( SYSDATE, 1007);

/*Error starting at line : 49 in command -
INSERT INTO email_log
(emaildate, customer#)
VALUES( SYSDATE, 1007)
Error report -
ORA-01400: cannot insert NULL into ("ORA530"."EMAIL_LOG"."EMAILID")
ERROR OCCURED BECAUSE A  NULL VALUES WAS ATTEMPTED TO BE INSERTED*/

INSERT INTO email_log
(emailid, emaildate, customer#)
VALUES(DEFAULT, SYSDATE, 1008);

/*Error starting at line : 60 in command -
INSERT INTO email_log
(emailid, emaildate, customer#)
VALUES(DEFAULT, SYSDATE, 1008)
Error report -
ORA-01400: cannot insert NULL into ("ORA530"."EMAIL_LOG"."EMAILID")
ERROR OCCURED BECUASE A NULL WAS ATTEMPTED TO BE INSERTED*/

INSERT INTO email_log
(emailid, emaildate, customer#)
VALUES(25, SYSDATE, 1009);


--7.
CREATE SYNONYM NUMGEN
FOR MY_FIRST_SEQ;

--8.
SELECT NUMGEN.CURRVAL
FROM dual;

DROP SYNONYM NUMGEN;

DROP SEQUENCE MY_FIRST_SEQ;

--9.
CREATE BITMAP INDEX customers_state_idx
ON customers (state);

SELECT table_name, index_name, index_type
FROM user_indexes
WHERE table_name = 'CUSTOMERS';

DROP INDEX customers_state_idx;

--10.
CREATE BITMAP INDEX customers_lastname_idx
ON customers (lastname);

SELECT table_name, index_name, index_type
FROM user_indexes
WHERE table_name = 'CUSTOMERS';

DROP INDEX customers_lastname_idx;

--11.
CREATE INDEX orders_shipdays_idx
ON orders(shipdate-orderdate);

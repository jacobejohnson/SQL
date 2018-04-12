--Jacob Johnson
--chapter 4

--1.
drop table store_reps;

create table store_reps
(rep_id number(5),
 last varchar2(15),
 first varchar2(10),
 comm char(1) default 'Y',
 constraint store_reps_id_pk
 primary key (rep_id)
);

--2.

alter table store_reps
 modify (last, first constraint store_reps_last_first_nn not null);

--3.
alter table store_reps
 add constraint store_reps_comm_ck CHECK (comm = 'Y' OR comm = 'N');
 
--4.
ALTER TABLE store_reps
 ADD (Base_salary Number(7,2);
ALTER TABLE store_reps
 ADD CONSTRAINT store_reps_base_salary_ck CHECK (Base_salary > 0));
 
 
--5.
DROP TABLE BOOK_STORES;

CREATE table BOOK_STORES
 (Store_ID NUMBER(8),
  Name VARCHAR2(30) NOT NULL,
  Contact VARCHAR2(30),
  REP_ID VARCHAR2(5),
  CONSTRAINT book_stores_store_id_pk PRIMARY KEY (store_id), 
  CONSTRAINT book_stores_name_uk UNIQUE (name)); 
  
--6.
ALTER TABLE BOOK_STORES
 ADD CONSTRAINT book_stores_rep_id_fk FOREIGN KEY (rep_id)
    REFERENCES store_reps (rep_id);

--7. 
ALTER TABLE store_reps
 DROP PRIMARY KEY CASCADE;
 
--8.
DROP TABLE rep_contracts;

CREATE TABLE rep_contracts
(store_id NUMBER(8),
 Name NUMBER(5),
 Quarter CHAR(3),
 Rep_ID NUMBER(5),
 CONSTRAINT rep_contracts_composite_pk PRIMARY KEY (store_id, quarter, rep_id),
 CONSTRAINT rep_contracts_re_id_fk FOREIGN KEY (rep_id)
  REFERENCES rep_contracts (rep_id),
 CONSTRAINT rep_contracts_store_id_fk FOREIGN KEY (store_id)
  REFERENCES rep_contracts (store_id)
 );
 
--9.
SELECT constraint_name, constraint_type, search_condition, r_constraint_name
 FROM user_constraints
 WHERE table_name = 'store_reps';
 
 --10. 
ALTER TABLE store_reps
 DISABLE CONSTRAINT store_reps_base_salary_ck;
 
ALTER TABLE store_reps
 ENABLE CONSTRAINT store_reps_base_salary_ck;
 

C:\Users\VASANT PATIL homeuse\.dbclient\storage\1788316269271@@127.0.0.1@3306 old adress
CREATE DATABASE DB_D1374;


use DB_D1374;

create table tbl_country(country_id numeric(5),country_name varchar(50));
create table tbl_state(state_id int,state_name varchar(50),country_id numeric(5));

desc tbl_state;
alter table tbl_state rename column state_id to st_rank;

ALTER TABLE tbl_state MODIFY COLUMN st_rank NUMERIC(2);

ALTER TABLE tbl_state MODIFY COLUMN st_rank NUMERIC(3);

alter table tbl_state drop COLUMN state_id;

drop table state;



tbl_country
tbl_state
tbl_city
tbl_employee



DDL[Data Definition Language]->    CREATE, ALTER, DROP, TRUNCATE, DESC
DML[Data Manipulation Language] -> INSERT, UPDATE, DELETE 
DCL[Data control Language]      -> GRANT, REVOKE
TCL[Transaction Control Language]-> COMMIT, ROLLBACK, SAVEPOINT
DQL[Data Query Language] -> SELECT




CREATE DATABASE DB_D1374;

USE DB_D1374;

CREATE TABLE TBL_COUNTRY
(
  COUNTRY_ID  NUMERIC(5),
  COUNTRY_NAME VARCHAR(50)
);

CREATE TABLE TBL_STATE
(
  STATE_ID INT,
  STATE_NAME VARCHAR(50),
  COUNTRY_ID NUMERIC(5) 

);

DESC TBL_STATE;
ALTER TABLE TBL_STATE RENAME COLUMN STATE_RANK TO ST_RANK;

ALTER TABLE TBL_STATE ADD STATE_RANK NUMERIC(2);

ALTER TABLE TBL_STATE MODIFY STATE_RANK NUMERIC(3);

DROP TABLE TBL_STATE;

ALTER TABLE TBL_STATE DROP COLUMN ST_RANK;







day 2

CREATE TABLE TBL_COUNTRY
(
  COUNTRY_ID  NUMERIC(5) primary key,
  COUNTRY_NAME VARCHAR(50)
);

insert into tbl_country values(101,'INDIA'),(102,'AMERICA');
SELECT * FROM tbl_country;

DELETE FROM tbl_country WHERE COUNTRY_ID = 101;



desc tbl_country;

drop table tbl_country;

CREATE TABLE TBL_STATE
(
  STATE_ID INT primary key,
  STATE_NAME VARCHAR(50),
  COUNTRY_ID NUMERIC(5)  references tbl_country(COUNTRY_ID) 
  #foreign key(COUNTRY_ID) references tbl_country(COUNTRY_ID)
);

SELECT * FROM tbl_state;

INSERT INTO tbl_state VALUES(1001,'MAHARASTRA',101),(1002,'GUJRAT',101),(1003,'CALIFORNIA',102),
(1004, 'LOS ANGELES', 102),(1005,'COLAMBO',NULL);

drop table tbl_state;



day 3
SELECT * FROM TAB;

SELECT * FROM REGIONS;
SELECT * FROM COUNTRIES;
SELECT * FROM LOCATIONS;
SELECT * FROM DEPARTMENTS;


SELECT REGION_NAME, COUNTRY_NAME
FROM REGIONS R 
JOIN COUNTRIES C
ON R.REGION_ID = C.REGION_ID
ORDER BY REGION_NAME


SELECT REGION_NAME, COUNT(COUNTRY_NAME) AS "TOTAL COUNTRIES"
FROM REGIONS R 
JOIN COUNTRIES C
ON R.REGION_ID = C.REGION_ID
--WHERE REGION_NAME IN ('Americas','Europe')  
GROUP BY REGION_NAME
HAVING REGION_NAME IN ('Americas','Europe')
ORDER BY REGION_NAME




day 4 24 8 2026

DROP TABLE tbl_country;
DROP TABLE tbl_state;

CREATE TABLE TBL_COUNTRY
(
  COUNTRY_ID NUMERIC(4) PRIMARY KEY,
  COUNTRY_NAME VARCHAR(50) NOT NULL  
);	

INSERT INTO TBL_COUNTRY VALUES
(1,'INDIA'),(2,'RUSSIA'),(3,'SRILANKA');

SELECT * FROM tbl_country;


CREATE TABLE TBL_STATE
(
   STATE_ID NUMERIC(4) PRIMARY KEY,
   STATE_NAME VARCHAR(50) NOT NULL,
   COUNTRY_ID NUMERIC(4) REFERENCES TBL_COUNTRY(COUNTRY_ID)   
);

INSERT INTO TBL_STATE VALUES
(1,'MAHARASTRA', 1),  
(2,'GUJRAT',1),
(3,'UTTAR PRADESH',1),
(4,'RAJASTHAN',1),
(5,'DELHI',1),
(6,'ADYGEA',2),
(7,'ALTAI',2),
(8,'COLAMBO',3),
(9,'KANDY',3);

SELECT * FROM tbl_state;

SELECT COUNTRY_NAME, STATE_NAME
FROM tbl_country C INNER JOIN tbl_state S
ON C.COUNTRY_ID = S.COUNTRY_ID
WHERE C.COUNTRY_NAME IN ('INDIA','RUSSIA')
ORDER BY S.STATE_NAME


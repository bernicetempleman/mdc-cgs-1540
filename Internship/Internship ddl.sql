USE INTERNSHIP
GO

DROP TABLE INTERNSHIP
DROP TABLE COMPANY
DROP TABLE STUDENT
GO

CREATE TABLE STUDENT
(
	st_name		varchar(10) PRIMARY KEY,
	st_major	char(20) NOT NULL,
	st_status	char(2)	
)

CREATE TABLE COMPANY
(
	co_name		char(5) PRIMARY KEY,
	co_size		decimal(4),
	co_headquarters char(10)
)

CREATE TABLE INTERNSHIP
(
	in_co_name	char(5) NOT NULL REFERENCES COMPANY(co_name),
	in_st_name  varchar(10) NOT NULL REFERENCES STUDENT(st_name),
	in_year		decimal(4) NOT NULL,
	in_quarter	char(10) NOT NULL,
	in_location	char(15),
	in_stipend	decimal(4),
	CONSTRAINT PK_01 PRIMARY KEY(in_co_name, in_st_name, in_year, in_quarter)
)

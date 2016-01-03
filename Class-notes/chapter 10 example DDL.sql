USE CGS1540
GO

DROP TABLE book_ORDERS;
DROP TABLE book_MEDICATION;
DROP TABLE book_PATIENT;
DROP TABLE book_PATIENT_SUGARLAND;


CREATE TABLE book_PATIENT
(
	pat_p#a			char(2),
	pat_p#n			char(5),
	pat_name		varchar(41) NOT NULL,
	pat_gender		char(1),
	pat_age			smallint NOT NULL,
	pat_admit_dt	date NOT NULL,
	pat_wing		char(1),
	pat_room#		integer,
	pat_bed			char(1),
	CONSTRAINT pk_patient PRIMARY KEY(pat_p#a, pat_p#n),
	CONSTRAINT chk_gender1 CHECK (pat_gender IN ('M','F')),
	CONSTRAINT chk_age1 CHECK (pat_age BETWEEN 1 AND 90),
	CONSTRAINT chk_bed1 CHECK (pat_bed IN ('A','B'))
);

CREATE TABLE book_MEDICATION
(
	med_code		char(5) CONSTRAINT uq_med UNIQUE,
	med_name		varchar(31) PRIMARY KEY,
	med_unitprice	decimal(3,2) CONSTRAINT chk_price1 CHECK (med_unitprice < 4.50),
	med_qty_onhand	integer NOT NULL,
	med_qty_onorder	integer,
	CONSTRAINT chk_qty CHECK ((med_qty_onhand + med_qty_onorder) BETWEEN 1000 AND 3000)
);

CREATE TABLE book_ORDERS
(
	order_rx#		char(13) CONSTRAINT pk_ord PRIMARY KEY,
	ord_pat_p#a		char(2)  NOT NULL,
	ord_pat_p#n		char(5) NOT NULL,
	ord_med_code	char(5) CONSTRAINT fk_med FOREIGN KEY REFERENCES book_MEDICATION(med_code),
	ord_dosage		smallint DEFAULT 2 CONSTRAINT chk_dosage CHECK (ord_dosage BETWEEN 1 AND 3),
	ord_freq		smallint DEFAULT 1 CONSTRAINT chk_frequency CHECK (ord_freq IN (1,2,3)),
	CONSTRAINT fk_pat FOREIGN KEY (ord_pat_p#a, ord_pat_p#n)
	REFERENCES book_PATIENT(pat_p#a, pat_p#n)
)

CREATE TABLE book_PATIENT_SUGARLAND
(
	pat_p#a			char(2),
	pat_p#n			char(5),
	pat_name		varchar(41) NOT NULL,
	pat_gender		char(1),
	pat_age			smallint NOT NULL,
	pat_admit_dt	date NOT NULL,
	CONSTRAINT pk_patient1 PRIMARY KEY(pat_p#a, pat_p#n),
	CONSTRAINT chk_gender2 CHECK (pat_gender IN ('M','F')),
	CONSTRAINT chk_age2 CHECK (pat_age BETWEEN 1 AND 90)
);

INSERT INTO book_PATIENT_SUGARLAND
VALUES ('LH','97384','Lisauckis, Hal', 'M', 69, '2014-06-06')
INSERT INTO book_PATIENT_SUGARLAND
VALUES ('HJ','99182','Hargrove, Jan', 'F', 21, '2014-05-25')
INSERT INTO book_PATIENT_SUGARLAND
VALUES ('RN','31678','Robbins, Nancy', 'F', 57, '2014-06-01')

INSERT INTO book_PATIENT(pat_p#a, pat_p#n, pat_name, pat_gender, pat_age, pat_admit_dt)
VALUES  ('RN','31678','Robbins, Nancy', 'F', 57, '2014-06-01')
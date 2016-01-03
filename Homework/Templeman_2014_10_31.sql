
DROP TABLE orders;
DROP TABLE medication;
DROP TABLE patient;

CREATE TABLE patient
(Pat_p#a	char (2) NOT NULL,
Pat_p#n		char(5),
Pat_name	varchar(41),
Pat_gender	char (1) 
CONSTRAINT chk_gender CHECK (pat_gender IN ('M', 'F')),
Pat_age		smallint,
Pat_admit_dt	date,
Pat_wing	char(1),
Pat_room#	integer,
Pat_bed		char (1) DEFAULT 'a',
creation_date datetime DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT pk_patient PRIMARY KEY (pat_p#a,pat_p#n),
CONSTRAINT chk_age CHECK (pat_age BETWEEN 0 AND 90)

);

CREATE TABLE medication
(Med_code	char(5),
Med_name	varchar(31) CONSTRAINT pk_med PRIMARY KEY,
Med_unitPrice	decimal (3,2),
Med_qty_onhand integer,
Med_qty_onorder integer,
 CONSTRAINT uq_mcode UNIQUE(med_code)
);

CREATE TABLE orders
(Ord_rx#	char (13),
Ord_pat_p#a	char (2),
Ord_pat_p#n	char (5),
Order_med_code	char (5),
Ord_dosage	smallint,
Ord_freq	smallint,
CONSTRAINT fk_patient 
	FOREIGN KEY(Ord_pat_p#a, Ord_pat_p#n)
	REFERENCES patient (Pat_p#a, Pat_p#n)
);
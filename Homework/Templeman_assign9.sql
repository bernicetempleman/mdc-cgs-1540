DROP TABLE prescription;
DROP TABLE physician;
DROP TABLE medication;
DROP TABLE patient;

CREATE TABLE  patient
(
Pat_pid			char(7) NOT NULL,
Pat_name     	char (41) NULL,
Pat_occup    	char(31) NULL,
Pat_gender  	char(1) NULL,
Pat_age         smallint NULL,
Pat_ins         char(31) NULL,
CONSTRAINT pk_patient PRIMARY KEY (Pat_pid),
CONSTRAINT chk_gender CHECK (Pat_gender IN ('M', 'F')),
CONSTRAINT chk_age CHECK (Pat_age BETWEEN 0 AND 90)
);

CREATE TABLE medication
(
Med_name      	char(31) NOT NULL,
Med_code        char(5) NOT NULL,
Med_listprice   decimal(3,2) NULL,
CONSTRAINT pk_medication PRIMARY KEY (Med_code),
CONSTRAINT uq_med_name UNIQUE(Med_name),
CONSTRAINT ck_listprice CHECK ( Med_listprice < 10.00)
);

CREATE TABLE physician
(
Phy_ph#     	integer NOT NULL,
Phy_name      	char(41) NOT NULL,
Phy_phone 		numeric NOT NULL,
Phy_experience	integer NULL,
Phy_specialty  	integer NULL,
CONSTRAINT pk_physician PRIMARY KEY (Phy_ph#),
CONSTRAINT uq_phy_name UNIQUE(Phy_name),
CONSTRAINT ck_experience CHECK (Phy_experience BETWEEN 1 AND 70)
);

CREATE TABLE prescription
(
Pre_p#         	char (13) NOT NULL,
Pre_date      	datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
Pre_dosage      smallint NULL,
Pre_freq      	smallint NULL,
Pre_pat_pid		char (7),
Pre_med_code  	char(5),
Pre_phy_Ph#     integer,
CONSTRAINT pk_prescription PRIMARY KEY (Pre_p#),
CONSTRAINT ck_dosage CHECK ( Pre_dosage BETWEEN 1 AND 3),
CONSTRAINT ck_frequency CHECK ( Pre_freq  BETWEEN 1 AND 3),
CONSTRAINT fk_prescription1 
	FOREIGN KEY(Pre_pat_pid)
	REFERENCES patient (Pat_pid),
CONSTRAINT fk_prescription2 
	FOREIGN KEY(Pre_med_code)
	REFERENCES medication (Med_code),
CONSTRAINT fk_prescription3 
	FOREIGN KEY(Pre_phy_Ph#)
	REFERENCES physician (Phy_ph# )
);


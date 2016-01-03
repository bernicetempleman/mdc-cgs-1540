CREATE TABLE  patient
(
Pat_pid		char(7),
Pat_name     	char (41),
Pat_occup    	char(31),
Pat_gender  	char(1),
Pat_age         smallint,
Pat_ins         char(31)
);

CREATE TABLE medication
(
Med_name      	char(31),
Med_code        char(5),
Med_listprice   decimal(3,2)
);

CREATE TABLE prescription
(
Pre_p#         	char (13),
Pre_date      	date,
Pre_dosage      smallint,
Pre_freq      	smallint,
Pre_pat_pid	char (7),
Pre_med_code  	char(5),
Pre_phy_Ph#     integer
);

CREATE TABLE physician
(
Phy_ph#     	integer,
Phy_name      	char(41),
Phy_phone 	number(10),
Phy _experience integer,
Phy_specialty  	integer
);
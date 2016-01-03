CREATE TABLE patient
(Pat_p#a	char (2),
Pat_p#n		char(5),
Pat_name	varchar(41),
Pat_gender	char (1),
Pat_age		smallint,
Pat_admit_dt	date,
Pat_wing	char(1),
Pat_room#	integer,
Pat_bed		char (1)
);

CREATE TABLE medication
(Med_code	char(5),
Med_name	varchar(31),
Med_qty_onhand integer,
Med_qty_onorder integer,
Med_unitPrice	decimal (3,2)
);

CREATE TABLE orders
(Ord_rx#	char (13),
Ord_pat_p#a	char (2),
Ord_pat_p#n	char (5),
Order_med_code	char (5),
Ord_dosage	smallint,
Ord_freq	smallint
);


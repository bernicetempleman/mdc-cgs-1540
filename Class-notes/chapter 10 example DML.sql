USE cgs1540
go

-- show no column names specified
INSERT INTO book_PATIENT VALUES ('DB','77642','Davis, Bill', 'M', 27, '2013-07-07', 'B', 108, 'B');
INSERT INTO book_MEDICATION VALUES('TAG','Tagamet', 3.00, 3000, 0);
INSERT INTO book_ORDERS VALUES('104','DB','77642','TAG',3,1);

-- show PK error
INSERT INTO book_PATIENT VALUES ('DB','77642','Davis, Gina', 'F', 29, '2013-07-08', 'A', 108, 'A');

-- show with column names specified... NULL fields or fields with a default are not required
INSERT INTO book_PATIENT(pat_p#a, pat_p#n, pat_name, pat_age, pat_admit_dt)
VALUES ('GD','72222','Grimes, David', 44, '2013-07-12');

-- see contents of book_PATIENT table
SELECT * FROM book_PATIENT;

-- show FK error for INSERT... medication KEF is not there
INSERT INTO book_ORDERS VALUES ('109','GD', '72222', 'KEF', 1, 1);

-- multi-row insert
INSERT INTO book_PATIENT(pat_p#a, pat_p#n, pat_name, pat_gender, pat_age, pat_admit_dt)
SELECT * FROM book_PATIENT_SUGARLAND;

-- show FK error for DELETE
DELETE FROM book_PATIENT
 WHERE pat_name LIKE '%Davis, Bill%';

-- show DELETE
DELETE FROM book_PATIENT
 WHERE pat_name LIKE '%Robbins, Nancy%';

-- be careful... no WHERE clause in DELETE statement will delete EVERYTHING
DELETE FROM book_MEDICATION;

 -- run inserts for medication here
INSERT INTO book_MEDICATION VALUES('VIB','Vibramycin', 1.5, 1700, 300);
INSERT INTO book_MEDICATION VALUES('KEF','Keflin', 2.5, 900, 410);
INSERT INTO book_MEDICATION VALUES('ASP','Aspirin', 0.02, 3000, 0);
INSERT INTO book_MEDICATION VALUES('PCN','Penicillin', 0.4, 2700, 0);
INSERT INTO book_MEDICATION VALUES('VAL','Valium', 0.75, 2100, 0);

-- UPDATE MEDICATION -- check constraint gets violated
UPDATE book_MEDICATION
SET med_qty_onhand = med_qty_onhand+500
WHERE med_unitprice > 0.50;

-- remove TAG from where clause
UPDATE book_MEDICATION
SET med_qty_onhand = med_qty_onhand+500
WHERE med_unitprice > 0.50 AND med_code <> 'TAG';

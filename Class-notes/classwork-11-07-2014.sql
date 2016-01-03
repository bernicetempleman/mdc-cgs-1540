select * from book_patient;

insert into book_patient 
VALUES ('DB', '77642','Davis, Bill', 'M', 27, '2013-07-07', 'B', 108, 'B', '3055551212')

INSERT INTO book_Medication 
VALUES ('tag', 'Tagamet', 3.00, 3000, 0)

select * from book_MEDICATION

INSERT INTO book_ORDERS
VALUES ('104','DB', '77642','TAG',3,1)

SELECT * FROM book_ORDERS

INSERT INTO book_PATIENT
(pat_p#a, pat_p#n, pat_name, pat_age, pat_admit_dt, pat_phone#)
VALUES ('GD','72222', 'Grimes, David', 44, '2013-07-12', 44, '2013-07-12', '3055551213')

select * from book_patient;

INSERT INTO book_ORDERS
VALUES ('109','GD','72222', 'KEF', 1,1); --med doesn't exist yet

SELECT * FROM book_ORDERS
select * from book_MEDICATION

SELECT * FROM book_PATIENT_SUGARLAND

INSERT INTO book_PATIENT 
(pat_p#a,pat_p#n, pat_name, pat_age, pat_admit_dt, pat_phone#, pat_gender)
SELECT pat_p#a,pat_p#n, pat_name, pat_age, pat_admit_dt, pat_phone#, pat_gender
FROM book_PATIENT_SUGARLAND; --populate with data from another table

select * from book_patient;

SELECT * FROM book_PATIENT
WHERE pat_age > 40 or pat_gender='M'

SELECT * 
	FROM book_PATIENT
	WHERE pat_name 
	LIKE 'G%'

DELETE from book_PATIENT
	WHERE pat_name LIKE 'DAVIS%'
	-- conflicts with a reference constraint, he has a prescription/order dependent on him
	
	SELECT * 
	FROM book_PATIENT

	DELETE from book_PATIENT
	WHERE pat_name LIKE 'Grimes%'

	SELECT * 
	FROM book_PATIENT

	SELECT * FROM book_MEDICATION

	UPDATE book_MEDICATION
	SET med_qty_onhand = med_qty_onhand+500
	WHERE med_unitprice> 0.50
		AND med_code <> 'TAG'; -- not equal

	SELECT * FROM book_MEDICATION


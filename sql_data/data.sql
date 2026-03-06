INSERT INTO manufacturers VALUES
(1,'Pfizer','Bad Pharma St','New York','NY','10017','2332332333'),
(2,'Boo Big Pharma','1 Greed Plaza','New Brunswick','NJ','08901','7325240400');

INSERT INTO doctors VALUES
(1,'Alyssa','Nguyen','7325551001','NJ483920'),
(2,'Marcus','Reed','9085552033','NJ771245');

INSERT INTO suppliers VALUES
(1,'Medical Supply','100 Warehouse Way','Edison','NJ','08817','7325559900',1),
(2,'Pharma Supply','22 Route 1','Rahway','NJ','07065','7325554411',2);

INSERT INTO medicines VALUES
(1,'Amoxicillin 500mg','Antibiotic',12.99,50,1),
(2,'Ibuprofen 200mg','Pain Relief',7.49,120,2);

INSERT INTO patients VALUES
(1,'James','Harris','12 Ocean Ave','West Belmar','NJ','07719','7325550101',1),
(2,'Maria','Lopez','88 Cedar St','Asbury Park','NJ','07712','7325550202',2);

INSERT INTO patient_medications VALUES
(1,1,1,'2024-01-01','Take once daily'),
(6,2,2,'2024-02-01','Take as needed');
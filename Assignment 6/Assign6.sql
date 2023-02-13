--Darrius White
--Z1900146
--Assign5
--Due: 2/26/2020



--1
DROP TABLE `Visit`;
DROP TABLE `Dog`;


--2
CREATE TABLE Dog(
	dogID       CHAR(9)      PRIMARY KEY,
	breed       CHAR(30)     NOT NULL,
	name        CHAR(25)     NOT NULL,
	weight_lbs DECIMAL(4,1)  NOT NULL
   );


--3
INSERT INTO Dog
	(dogID, breed, name, weight_lbs)
	VALUES
	      ('11122233A', 'Dachshund', 'Hotdog', 20.5),
	      ('11122233B', 'Pit Bull', 'Terminator', 60.3),
	      ('11122233C', 'Beagle', 'Georgie', 22.8),
	      ('11122233D', 'Pug', 'Ugly', 16.0),
	      ('11122233E', 'German Shepherd', 'Germaine', 87.8),
	      ('11122233F', 'Chihuahua', 'Cthulhu', 4.1);

--4
DESCRIBE Dog;



--5
SELECT * FROM Dog;



--6
CREATE TABLE Visit(
	visitID    CHAR(9),
	dogID      CHAR(9),
	visitStart DATETIME NOT NULL,
	visitEnd   DATETIME NOT NULL,

   PRIMARY KEY (visitID, dogID),
   FOREIGN KEY (dogID) REFERENCES Dog(dogID)
   );



--7
INSERT INTO Visit
		(visitID, dogID, visitStart, visitEnd)
		VALUES
		      ('AAABBBCC1', '11122233A', '2020-01-05 10:30:00', '2020-01-05 10:56:24'),
		      ('AAABBBCC2', '11122233E', '2020-03-21 12:15:53', '2020-03-21 13:10:01'),
		      ('AAABBBCC3', '11122233A', '2020-06-13 09:48:45', '2020-06-13 10:05:00'),
		      ('AAABBBCC4', '11122233D', '2020-09-02 15:39:13', '2020-09-02 16:59:42'),
		      ('AAABBBCC5', '11122233C', '2020-09-02 18:11:18', '2020-09-02 18:50:29'),
		      ('AAABBBCC6', '11122233F', '2021-01-10 08:30:00', '2021-01-10 09:42:36'),
		      ('AAABBBCC7', '11122233F', '2021-01-12 12:37:04', '2021-01-12 12:53:21'),
		      ('AAABBBCC8', '11122233B', '2021-01-23 11:23:38', '2021-01-23 11:55:02'),
		      ('AAABBBCC9', '11122233D', '2021-02-07 15:16:17', '2021-02-07 16:17:18');



--8
DESCRIBE Visit;



--9
SELECT * FROM Visit;



--10
ALTER TABLE Visit ADD bill DECIMAL(6,2) NOT NULL;



--11
UPDATE Visit
	SET bill=
	CASE visitID
		WHEN 'AAABBBCC1' THEN 100.23
		WHEN 'AAABBBCC2' THEN 48.00
		WHEN 'AAABBBCC3' THEN 256.96
		WHEN 'AAABBBCC4' THEN 1022.62
		WHEN 'AAABBBCC5' THEN 57.33
		WHEN 'AAABBBCC6' THEN 98.99
		WHEN 'AAABBBCC7' THEN 32.08
		WHEN 'AAABBBCC8' THEN 88.88
		WHEN 'AAABBBCC9' THEN 365.24
	END
	WHERE visitID IN ('AAABBBCC1', 'AAABBBCC2', 'AAABBBCC3', 'AAABBBCC4', 
			  'AAABBBCC5', 'AAABBBCC6', 'AAABBBCC7', 'AAABBBCC8', 'AAABBBCC9');



--12
SELECT * FROM Visit;

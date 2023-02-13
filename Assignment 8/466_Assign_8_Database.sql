CREATE TABLE S(
	S	INT 	  PRIMARY KEY,
	SNAME	CHAR(20)  NOT NULL,
	STATUS  INT	  NOT NULL,
	CITY	CHAR(20)  NOT NULL
);

INSERT INTO S
	(S, SNAME, STATUS, CITY)
	VALUES
		(1, 'Smith', 20, 'London'),
		(2, 'Jones', 10, 'Paris'),
		(3, 'Blake', 30, 'Paris'),
		(4, 'Clark', 20, 'London'),
		(5, 'Adams', 30, 'Athens');

CREATE TABLE P(
	P	INT	  PRIMARY KEY,
	PNAME	CHAR(20)  NOT NULL,
	COLOR	CHAR(20)  NOT NULL,
	WEIGHT	INT	  NOT NULL
);

INSERT INTO P
	(P, PNAME, COLOR, WEIGHT)
	VALUES
		(1, 'Nut', 'Red', 12),
		(2, 'Bolt', 'Green', 17),
		(3, 'Screw', 'Blue', 17),
		(4, 'Screw', 'Red', 14),
		(5, 'Cam', 'Blue', 12),
		(6, 'Cog', 'Red', 19);

CREATE TABLE SP(
	S	INT	NOT NULL,
	P	INT	NOT NULL,
	QTY	INT	NOT NULL,

	PRIMARY KEY (S, P),
	FOREIGN KEY (S) REFERENCES S(S),
	FOREIGN KEY (P) REFERENCES P(P)
);

INSERT INTO SP
	(S, P, QTY)
	VALUES
		(1, 1, 300), (1, 2, 200), (1, 3, 400), (1, 4, 200),
		(1, 5, 100), (1, 6, 100), (2, 1, 300), (2, 2, 400),
		(3, 2, 200), (4, 2, 200), (4, 4, 300), (4, 5, 400);
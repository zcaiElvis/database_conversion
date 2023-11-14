USE mydb;

-- Inserting in to cities
INSERT INTO cities 
VALUES(1, "SEA", 20),
(2, "MIA", 30),
(3, "LA", 40);

-- Inserting into demographics
INSERT INTO demographics
VALUES(1, "m", "white", null, null),
(2, "m", "black", null, null),
(3, "m", "hispanic", null, null),
(4, "f", "white", null, null),
(5, "f", "black", null, null),
(6, "f", "hispanic", null, null);


-- Inserting into time
INSERT INTO time
VALUES(2012),
(2013),
(2014);


-- Inserting into variable
INSERT INTO variables
VALUES(1, "pop.total");

-- Inserting into distribution
INSERT INTO distribution
VALUES(1, 1, 1, null, 599277, null, null, null),
(1, 1, 2, null, 599277, null, null, null);


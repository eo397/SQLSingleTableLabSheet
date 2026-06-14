
-- Single Table Lab Sheet

CREATE TABLE pet (name VARCHAR(20), owner VARCHAR(20), species VARCHAR(20), sex CHAR(1), checkups SMALLINT UNSIGNED, birth DATE, death DATE);

. schema
. table

INSERT INTO pet (name,owner,species,sex,checkups,birth,death)VALUES 
('Fluffy','Harold','cat','f',5,'2001-02-04',NULL), 
('Claws','Gwen','cat','m',2,'2000-03-17',NULL), 
('Buffy','Harold','dog','f',7,'1999-05-13',NULL), 
('Fang','Benny','dog','m',4,'2000-08-27',NULL), 
('Bowser','Diane','dog','m',8,'1998-08-31','2001-07-29'), 
('Chirpy','Gwen','bird','f',0,'2002-09-11',NULL), 
('Whistler','Gwen','bird','',1,'2001-12-09',NULL), 
('Slim','Benny','snake','m',5,'2001-04-29',NULL); 


/* Selecting Data from a Database:*/ 
SELECT * FROM pet; 

SELECT * FROM pet WHERE sex = 'm'; 

SELECT name, species, sex FROM pet WHERE species = 'snake' OR species 
= 'bird'; 

/* Q1-1. The names of owners and their pet's name for all pets who are female.*/
 SELECT name, owner, sex FROM pet WHERE sex = 'f'; 

 /*Q1-2. The names and birth dates of pets which are dogs.*/
 SELECT name, birth FROM pet WHERE species = 'dog'; 

 /*Q1-3. The names of the owners of birds.  */
  SELECT DISTINCT owner FROM pet WHERE species = 'bird'; 

  /*Q1-4. The species of pets who are female. */
  SELECT DISTINCT species FROM pet WHERE sex = 'f'; 

  /* Q1-5. The names and birth dates of pets which are cats or birds. */
  SELECT DISTINCT name, birth  FROM pet WHERE species = 'cat' OR species = 'bird';

  /* Q1-6. The names and species of pets which are cats or birds and which are female.*/
  SELECT DISTINCT name, species  
  FROM pet 
  WHERE species = 'cat' or species = 'bird'
  AND sex = 'f';

  /* Comparison Operators and Ordering Output: */
  SELECT name, sex FROM pet WHERE sex < 'm';

-- Q2-1. The names of owners and their pets where the pet's name ends with “er” or “all” 
  SELECT owner, name FROM pet WHERE name LIKE '%er' or name LIKE '%all';

-- Q2-2. The names of any pets whose owner's name contains an "e" 
  SELECT name FROM pet WHERE owner LIKE '%e%';

-- Q2-3. The names of all pets whose name does not end with "fy" 
  SELECT name FROM pet WHERE name NOT LIKE '%fy';

-- Q2-4. All pet names whose owners name is only four characters long 
  SELECT name FROM pet WHERE LENGTH(owner) = 4;

-- Q2-5. All owners whose names begin and end with one of the first five letters of the alphabet 
  SELECT owner FROM pet WHERE UPPER(owner) GLOB '[A-E]*[A-E]';

-- Q2-6. Repeat the previous query, but make the query sensitive to the case of letters of the alphabet the characters in the name
  SELECT owner FROM pet WHERE owner GLOB '[A-E]*[A-E]';

SELECT name, birth FROM pet ORDER BY birth; 
SELECT name, birth FROM pet ORDER BY birth DESC; 
SELECT name, species, birth FROM pet ORDER BY species, birth DESC;

/* Date Manipulation:*/
SELECT name FROM pet WHERE strftime('%m',birth) = strftime('%m','now'); 
SELECT name, strftime('%m', birth) FROM pet;
SELECT name, strftime('%m', birth)AS Month FROM pet; 

/* Counts and Value Manipulation:*/
SELECT owner, name, (checkups * 20) AS income FROM pet; 
SELECT owner, name, birth, MIN(strftime('%Y',birth)) AS birth FROM pet 
GROUP BY owner; 

/* Sample Questions */ 
-- Q3-1. The average number of check-ups that each owner has made with their pets 
SELECT owner, AVG(checkups) AS avg_checkups FROM pet GROUP BY owner;

-- Q3-2. The number of pets of each species in ascending order 
SELECT species, COUNT(*) AS num_pets FROM pet GROUP BY species ORDER BY num_pets ASC;

-- Q3-3. The number of pets of each species that each owner has 
SELECT owner, species, COUNT(*) AS num_pets FROM pet GROUP BY owner, species;

-- Q3-4. The number of distinct species of pet each owner has 
SELECT owner, COUNT(DISTINCT species) AS distinct_species FROM pet GROUP BY owner;

-- Q3-5. The number of pets of each gender there are in the database, where the gender is known 
SELECT sex, COUNT(*) AS num_pets FROM pet WHERE sex IS NOT NULL GROUP BY sex;

-- Q3-6. The number of birds each owner has 
SELECT owner, COUNT(*) AS num_birds FROM pet WHERE LOWER(species) = 'bird'
GROUP BY owner;

-- Q3-7. The total number of check-ups each owner has made with all their pets 
SELECT owner, SUM(checkups) AS total_checkups FROM pet GROUP BY owner;

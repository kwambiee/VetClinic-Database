/*Queries that provide answers to the questions from all projects.*/

select * FROM ANIMALS WHERE NAME LIKE '%mon';
select NAME FROM ANIMALS WHERE DATE_OF_BIRTH > '2016-01-01' AND DATE_OF_BIRTH < '2019-01-01';
select NAME FROM ANIMALS WHERE NEUTERED = TRUE AND ESCAPE_ATTEMPTS < 3;
select DATE_OF_BIRTH FROM ANIMALS WHERE NAME='Agumon' OR NAME='Pikachu';
select NAME,ESCAPE_ATTEMPTS FROM ANIMALS WHERE WEIGHT_KG > 10.5;
select * FROM ANIMALS WHERE NEUTERED = TRUE;
select * FROM ANIMALS WHERE NAME NOT LIKE 'Gabumon';
select * FROM ANIMALS WHERE WEIGHT_KG >= 10.4 AND WEIGHT_KG <= 17.3;

UPDATE animals SET species='digimon' WHERE name LIKE '%mon';
UPDATE animals SET species='pokemon' WHERE species IS NULL;

select COUNT(*) FROM animals;
select Count(*) FROM animals WHERE escape_attempts=0;
select AVG(weight_kg) FROM animals;
select neutered, Count(neutered) as number_of_animals,SUM(escape_attempts) as escape_total FROM animals GROUP BY neutered;
select species,MAX(weight_kg),MIN(weight_kg) FROM animals GROUP BY species;
select species,AVG(escape_attempts) FROM animals WHERE date_of_birth > DATE '1990-01-01' AND date_of_birth < DATE'2000-01-01' GROUP BY species;


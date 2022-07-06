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

select full_name,name FROM animals INNER JOIN owners ON animals.owner_id=owners.id WHERE full_name='Melody Pond';
select species.name, animals.name as animal as type FROM animals INNER JOIN species ON animals.species_id=species.id WHERE species.id=1;
select full_name,animals.name as animals_owned FROM animals RIGHT JOIN owners ON animals.owner_id=owners.id;
select species.name as species_type,Count(species_id) FROM animals INNER JOIN species ON animals.species_id=species.id GROUP BY species.name;
select owners.full_name,animals.name,species.name as type FROM animals JOIN species ON animals.species_id=species.id INNER JOIN owners ON owners.id=animals.owner_id WHERE species.name='Digimon' AND owners.full_name='Jennifer Orwell';
select full_name as Owner,animals.name,escape_attempts FROM animals INNER JOIN owners ON animals.owner_id=owners.id WHERE escape_attempts=0 AND full_name='Dean Winchester';
select full_name,Count(owner_id) FROM animals RIGHT JOIN owners ON animals.owner_id=owners.id GROUP BY owners.full_name ORDER BY Count(owner_id) DESC LIMIT 1;
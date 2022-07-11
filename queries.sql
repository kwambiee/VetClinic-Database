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
select species.name as type, animals.name as animal FROM animals INNER JOIN species ON animals.species_id=species.id WHERE species.id=1;
select full_name,animals.name as animals_owned FROM animals RIGHT JOIN owners ON animals.owner_id=owners.id;
select species.name as species_type,Count(species_id) FROM animals INNER JOIN species ON animals.species_id=species.id GROUP BY species.name;
select owners.full_name,animals.name,species.name as type FROM animals JOIN species ON animals.species_id=species.id INNER JOIN owners ON owners.id=animals.owner_id WHERE species.name='Digimon' AND owners.full_name='Jennifer Orwell';
select full_name as Owner,animals.name,escape_attempts FROM animals INNER JOIN owners ON animals.owner_id=owners.id WHERE escape_attempts=0 AND full_name='Dean Winchester';
select full_name,Count(owner_id) FROM animals RIGHT JOIN owners ON animals.owner_id=owners.id GROUP BY owners.full_name ORDER BY Count(owner_id) DESC LIMIT 1;

select vets.name as Vet, animals.name as animal,visits.visit_dates from animals JOIN visits ON visits.animals_id=animals.id INNER JOIN vets ON vets.id=visits.vets_id WHERE vets.id=1 ORDER BY visit_dates DESC LIMIT 1;
select vets.name as Vet, animals.name as animal FROM animals JOIN visits ON visits.animals_id=animals.id INNER JOIN vets ON vets.id=visits.vets_id WHERE vets.id=3 GROUP BY animals.name,vets.name;
select vets.name as Vets, species.name as specialties FROM species JOIN specializations ON species.id=specializations.species_id RIGHT JOIN vets ON specializations.vets_id=vets.id;
select vets.name as Vet, animals.name as animal,visit_dates FROM animals JOIN visits ON visits.animals_id=animals.id INNER JOIN vets ON vets.id=visits.vets_id WHERE vets.id=3 AND visit_dates> DATE '2020-04-01' AND visit_dates< DATE '2020-08-20';
select animals.name as animal, COUNT(animals_id) FROM animals JOIN visits ON visits.animals_id=animals.id INNER JOIN vets ON vets.id=visits.vets_id GROUP BY animals.name ORDER BY COUNT(animals_id)DESC LIMIT 1;
select vets.name as Vet, animals.name as animal,visits.visit_dates from animals JOIN visits ON visits.animals_id=animals.id INNER JOIN vets ON vets.id=visits.vets_id WHERE vets.id=2 ORDER BY visit_dates ASC LIMIT 1;
select vets.name as Vet, animals.name as animal,visits.visit_dates from animals JOIN visits ON visits.animals_id=animals.id INNER JOIN vets ON vets.id=visits.vets_id  ORDER BY visit_dates DESC LIMIT 1;
select species.name as type,Count(visit_dates) FROM species JOIN specializations ON species.id=specializations.species_id INNER JOIN visits ON specializations.vets_id=visits.vets_id WHERE specializations.vets_id=1 AND species_id=2 OR specializations.vets_id=4 AND species_id=1 GROUP BY species.name;
select species.name,Count(animals_id) FROM species JOIN specializations ON species.id=specializations.species_id INNER JOIN visits ON specializations.vets_id=visits.vets_id WHERE animals_id=5 OR animals_id=6 OR animals_id=8 GROUP BY species.name ORDER BY Count(animals_id) DESC LIMIT 1;

explain analyze SELECT COUNT(*) FROM visits where animals_id = 4;
explain analyze SELECT * FROM visits where vets_id = 2;
explain analyze SELECT * FROM owners where email = 'owner_18327@mail.com';

-- Using ckustured index.
explain analyze select visit_dates,animals_id from visits INNER JOIN vetidentification ON visits.vets_id=vetidentification.id WHERE vetidentification.id=2 LIMIT 100;
explain analyze select visit_dates,animals_id from visits INNER JOIN vetidentification ON visits.vets_id=vetidentification.id WHERE vetidentification.id=2 LIMIT 1000;

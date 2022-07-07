/* Populate database with sample data. */

INSERT INTO ANIMALS(ID,NAME,DATE_OF_BIRTH,ESCAPE_ATTEMPTS,NEUTERED,WEIGHT_KG)VALUES(1,'Agumon',DATE '2020-02-03',0,TRUE,10.23);
INSERT INTO ANIMALS VALUES (2,'Gabumon',DATE '2018-11-15',2,TRUE,8);
INSERT INTO ANIMALS VALUES (3,'Pikachu',DATE '2021-01-07',1,FALSE,15.04);
INSERT INTO ANIMALS VALUES (4,'Devimon',DATE '2017-05-12',5,TRUE,11);
INSERT INTO animals VALUES ('Charmander',DATE '2020-02-08',0,false,-11),('Plantmon',DATE '2021-11-05',2,true,-5.7);
INSERT INTO animals VALUES ('Squirtle',DATE '1993-04-02',3,true,-12.13),('Angemon',DATE '2005-06-12',1,true,-45),('Boarmon',DATE '2005-06-07',7,true,20.4),('Blossom',DATE '1998-10-13',3,true,17),('Ditto',DATE '2022-05-14',4,true,22);

UPDATE animals SET date_of_birth= DATE '2021-11-15' WHERE id=6;

INSERT INTO owners(full_name,age) VALUES('Sam Smith',34),('Jennifer Orwell',19),('Bob',45),('Melody Pond',77),('Dean Winchester',14),('Jodie Whittaker',38);

INSERT INTO species(name)VALUES('Pokemon'),('Digimon');

UPDATE animals SET species_id=1 WHERE name NOT LIKE '%mon';
UPDATE animals SET species_id=2 WHERE name LIKE '%mon';

UPDATE animals SET owner_id=1 WHERE name='Agumon';
UPDATE animals SET owner_id=2 WHERE name='Gabumon' OR name='Pikachu';
UPDATE animals SET owner_id=3 WHERE name='Devimon' OR name='Plantmon';
UPDATE animals SET owner_id=4 WHERE name='Squirtle'OR name='Charmander' OR name='Blossom';
UPDATE animals SET owner_id=5 WHERE name='Boarmon' OR name='Angemon';

INSERT INTO vets(name,age,date_of_graduation) VALUES('Vet William Tatcher',45,DATE '2000-04-23'),('Vet Maisy Smith',26,DATE '2019-01-17'),('Vet Stephanie Mendez',64,DATE '1981-05-04'),('Vet Jack Harkness',38,DATE '2008-06-08');

INSERT INTO specializations(species_id,vets_id)VALUES(1,1),(1,3),(2,3),(2,4);

INSERT INTO visits(animals_id,vets_id,visit_dates) VALUES(2,1,DATE'2020-05-24'),(2,3,DATE'2020-07-22'),(3,4,DATE'2021-02-02'),(6,2, DATE'2020-01-05'),(6,2, DATE'2020-04-08'),(6,2,DATE'2020-05-14'),(4,3,DATE'2021-05-04'),(7,4, DATE'2021-02-24'),(8,2,DATE'2019-12-21'),(8,1,DATE'2020-08-10'),(8,2, DATE'2021-04-07'),(10,3, DATE'2019-09-29'),(9,4, DATE'2020-10-03'),(9,4,DATE'2020-11-04'),(5,2,DATE'2019-01-24'),(5,2, DATE'2019-05-15'),(5,2,DATE'2020-02-27'),(5,2,DATE'2020-08-03'),(1,3,DATE'2020-05-25'),(1,1,DATE'2021-11-01');
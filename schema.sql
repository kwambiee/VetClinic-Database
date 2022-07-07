/* Database schema to keep the structure of entire database. */


CREATE TABLE ANIMALS(
    ID INT,
    NAME TEXT,
    DATE_OF_BIRTH DATE,
    ESCAPE_ATTEMPTS INT,
    NEUTERED BOOL,
    WEIGHT_KG DECIMAL);

    ALTER TABLE animals ADD species TEXT;
    ALTER TABLE animals DROP COLUMN id;
    ALTER TABLE animals ADD id SERIAL PRIMARY KEY;

CREATE TABLE owners(
    id SERIAL PRIMARY KEY,
    full_name TEXT,
    age INT);

CREATE TABLE species(
    id SERIAL PRIMARY KEY,
    name TEXT);

ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD species_id INT;
ALTER TABLE animals ADD owner_id INT;

ALTER TABLE animals ADD CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id);
ALTER TABLE animals ADD CONSTRAINT fk_owners FOREIGN KEY(owner_id) REFERENCES owners(id);

CREATE TABLE vets(
    id SERIAL PRIMARY KEY,
    name TEXT,
    age INT,
    date_of_graduation DATE);

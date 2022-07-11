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

CREATE TABLE specializations(
    species_id INT,
    vets_id INT);

ALTER TABLE specializations ADD CONSTRAINT fk_specializations FOREIGN KEY(species_id) REFERENCES species(id);
ALTER TABLE specializations ADD CONSTRAINT fk_vetspecialty FOREIGN KEY(vets_id) REFERENCES vets(id);

CREATE TABLE visits(
    animals_id INT,
    vets_id INT);

ALTER TABLE visits ADD CONSTRAINT fk_vetsID FOREIGN KEY(vets_id)REFERENCES vets(id);
ALTER TABLE visits ADD CONSTRAINT fk_visits FOREIGN KEY(animals_id)REFERENCES animals(id);
ALTER TABLE visits ADD COLUMN visit_dates DATE;

ALTER TABLE owners ADD COLUMN email VARCHAR(120);
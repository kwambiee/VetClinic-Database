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


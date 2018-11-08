DROP TABLE adoptions;
DROP TABLE owners;
DROP TABLE animals;

CREATE TABLE owners
(
  id SERIAL8 primary key,
  name VARCHAR(255),
  age INT4
);

CREATE TABLE animals
(
  id SERIAL8 primary key,
  name VARCHAR(255),
  age INT4,
  species VARCHAR(255),
  breed VARCHAR(255),
  sex VARCHAR(255),
  admission_date DATE,
  availability VARCHAR(255)
);

CREATE TABLE adoptions
(
  id SERIAL8 primary key,
  owner_id INT8 references owners(id),
  animal_id INT8 references animals(id)
);

-- INSERT INTO animals (name, age, species, breed, sex, admission_date, availability) VALUES ("Archie", "11", "Dog", "TT", "male", 20/12/2012, "available") RETURNING ID

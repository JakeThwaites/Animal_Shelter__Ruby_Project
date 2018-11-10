DROP TABLE adoptions;
DROP TABLE owners;
DROP TABLE animals;

CREATE TABLE owners
(
  id SERIAL8 primary key,
  name VARCHAR(255),
  age INT4,
  contact_number VARCHAR(15),
  address_1 VARCHAR(120) NOT NULL,
  address_2 VARCHAR(120),
  city VARCHAR(120),
  post_code VARCHAR(16) NOT NULL
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
  availability VARCHAR(255),
  pet_description TEXT
);

CREATE TABLE adoptions
(
  id SERIAL8 primary key,
  owner_id INT8 references owners(id) ON DELETE CASCADE,
  animal_id INT8 references animals(id) ON DELETE CASCADE,
  adoption_date DATE
);

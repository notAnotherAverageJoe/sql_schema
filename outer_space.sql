-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

-- Create galaxies table
CREATE TABLE galaxies
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

-- Insert data into galaxies table
INSERT INTO galaxies (name)
VALUES ('Milky Way');

-- Create planets table
CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period NUMERIC(10,2) NOT NULL,
  orbits_around TEXT NOT NULL,
  galaxy_id INT NOT NULL,
  moons TEXT[]
);

-- Insert data into planets table
INSERT INTO planets
  (name, orbital_period, orbits_around, galaxy_id, moons)
VALUES
  ('Earth', 1.00, 'The Sun', 1, '{"The Moon"}'),
  ('Mars', 1.88, 'The Sun', 1, '{"Phobos", "Deimos"}'),
  ('Venus', 0.62, 'The Sun', 1, '{}'),
  ('Neptune', 164.8, 'The Sun', 1, '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
  ('Proxima Centauri b', 0.03, 'Proxima Centauri', 1, '{}'),
  ('Gliese 876 b', 0.23, 'Gliese 876', 1, '{}');

-- Add foreign key constraint
ALTER TABLE planets
ADD CONSTRAINT fk_galaxy_id
FOREIGN KEY (galaxy_id) REFERENCES galaxies(id);

-- Create moons table
CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  planet_id INT NOT NULL
);

-- Insert data into moons table
INSERT INTO moons (name, planet_id)
VALUES ('The Moon', 1),
       ('Phobos', 2),
       ('Deimos', 2),
       ('Naiad', 4),
       ('Thalassa', 4),
       ('Despina', 4),
       ('Galatea', 4),
       ('Larissa', 4),
       ('S/2004 N 1', 4),
       ('Proteus', 4),
       ('Triton', 4),
       ('Nereid', 4),
       ('Halimede', 4),
       ('Sao', 4),
       ('Laomedeia', 4),
       ('Psamathe', 4),
       ('Neso', 4);

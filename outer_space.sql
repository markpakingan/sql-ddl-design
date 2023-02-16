-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around TEXT NOT NULL,
  galaxy TEXT NOT NULL,
  moons TEXT[]
);

INSERT INTO planets
  (name, orbital_period_in_years, orbits_around, galaxy, moons)
VALUES
  ('Earth', 1.00, 'The Sun', 'Milky Way', '{"The Moon"}'),
  ('Mars', 1.88, 'The Sun', 'Milky Way', '{"Phobos", "Deimos"}'),
  ('Venus', 0.62, 'The Sun', 'Milky Way', '{}'),
  ('Neptune', 164.8, 'The Sun', 'Milky Way', '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
  ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way', '{}'),
  ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way', '{}');

    -- ///////////////////////////////////////////////////////////////////////------

  CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around_list_id TEXT REFERENCES orbits_around_list;
  moons TEXT[]
);

INSERT INTO planets
  (name, orbital_period_in_years, orbits_around_list_id, moons)
VALUES
  ('Earth', 1.00, 1, '{"The Moon"}'),
  ('Mars', 1.88, 1,{"Phobos", "Deimos"}),
  ('Venus', 0.62, 1, '{}'),
  ('Neptune', 164.8, 1, '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
  ('Proxima Centauri b', 0.03, 2, '{}'),
  ('Gliese 876 b', 0.23, 3, '{}');

      -- ///////////////////////////////////////////////////////////////////////------

CREATE TABLE orbits_around_list
(
  id SERIAL PRIMARY KEY,
  orbits_around TEXT,
  galaxy TEXT
);

INSERT INTO orbits_around_list
  (orbits_around, galaxy)
VALUES
  ('The Sun', 'Milky Way'),
  ('Proxima Centauri b','Milky Way'),
  ('Gliese 876', 'Milky Way');
-- Drop the existing database if it exists
DROP DATABASE IF EXISTS air_traffic;

-- Create a new database
CREATE DATABASE air_traffic;

-- Connect to the new database
\c air_traffic

-- Create a table for airports
CREATE TABLE airports
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  city TEXT NOT NULL,
  country TEXT NOT NULL
);

-- Insert data into airports table
INSERT INTO airports (name, city, country)
VALUES
  ('Seattle-Tacoma International Airport', 'Seattle', 'United States'),
  ('Heathrow Airport', 'London', 'United Kingdom'),
  ('Los Angeles International Airport', 'Los Angeles', 'United States'),
  ('McCarran International Airport', 'Las Vegas', 'United States'),
  ('Mohammed V International Airport', 'Casablanca', 'Morocco'),
  ('Beijing Capital International Airport', 'Beijing', 'China'),
  ('Charlotte Douglas International Airport', 'Charlotte', 'United States'),
  ('Chicago O''Hare International Airport', 'Chicago', 'United States'),
  ('Louis Armstrong New Orleans International Airport', 'New Orleans', 'United States'),
  ('Sao Paulo/Guarulhos–Governador Andre Franco Montoro International Airport', 'Sao Paulo', 'Brazil'),
  ('Arturo Merino Benitez International Airport', 'Santiago', 'Chile');

-- Create a table for airlines
CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

-- Insert data into airlines table
INSERT INTO airlines (name)
VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brasil');

-- Create tickets table with foreign keys referencing airports and airlines
CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat VARCHAR(5) NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline_id INT NOT NULL,
  from_airport_id INT NOT NULL,
  to_airport_id INT NOT NULL
);

-- Insert data into tickets table
INSERT INTO tickets
  (first_name, last_name, seat, departure, arrival, airline_id, from_airport_id, to_airport_id)
VALUES
  ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 1),
  ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 6, 2),
  ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 3, 4),
  ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 1, 9),
  ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 8, 5),
  ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 7, 6),
  ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 9, 8),
  ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 10, 7),
  ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 8, 9),
  ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 11, 10);

-- Add foreign key constraints
ALTER TABLE tickets
ADD CONSTRAINT fk_airline_id
FOREIGN KEY (airline_id) REFERENCES airlines(id);

ALTER TABLE tickets
ADD CONSTRAINT fk_from_airport_id
FOREIGN KEY (from_airport_id) REFERENCES airports(id);

ALTER TABLE tickets
ADD CONSTRAINT fk_to_airport_id
FOREIGN KEY (to_airport_id) REFERENCES airports(id);

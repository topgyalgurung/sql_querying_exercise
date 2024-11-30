DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

-- previous --
-- CREATE TABLE tickets
-- (
--   id SERIAL PRIMARY KEY,
--   first_name TEXT NOT NULL,
--   last_name TEXT NOT NULL,
--   seat TEXT NOT NULL,
--   departure TIMESTAMP NOT NULL,
--   arrival TIMESTAMP NOT NULL,
--   airline TEXT NOT NULL,
--   from_city TEXT NOT NULL,
--   from_country TEXT NOT NULL,
--   to_city TEXT NOT NULL,
--   to_country TEXT NOT NULL
-- );

CREATE TABLE passengers (
    passenger_id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

CREATE TABLE flights (
    flight_id SERIAL PRIMARY KEY,
    departure TIMESTAMP NOT NULL,
    arrival TIMESTAMP NOT NULL,
    airline_id INT NOT NULL,
    from_city_id INT NOT NULL,
    to_city_id INT NOT NULL,
    FOREIGN KEY (airline_id) REFERENCES airlines(airline_id),
    FOREIGN KEY (from_city_id) REFERENCES cities(city_id),
    FOREIGN KEY (to_city_id) REFERENCES cities(city_id)
);

CREATE TABLE airlines (
    airline_id SERIAL PRIMARY KEY,
    airline_name TEXT NOT NULL
);

CREATE TABLE cities (
    city_id SERIAL PRIMARY KEY,
    city_name TEXT NOT NULL,
    country_name TEXT NOT NULL
);
DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

-- denormalized -- 
-- CREATE TABLE songs
-- (
--   id SERIAL PRIMARY KEY,
--   title TEXT NOT NULL,
--   duration_in_seconds INTEGER NOT NULL,
--   release_date DATE NOT NULL,
--   artists TEXT[] NOT NULL,
--   album TEXT NOT NULL,
--   producers TEXT[] NOT NULL
-- );

CREATE TABLE songs (
    song_id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    duration_in_seconds INTEGER NOT NULL,
    release_date DATE NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES albums(album_id)
);

CREATE TABLE albums (
    album_id SERIAL PRIMARY KEY,
    album_name TEXT NOT NULL
);

CREATE TABLE artists (
    artist_id SERIAL PRIMARY KEY,
    artist_name TEXT NOT NULL
);

CREATE TABLE producers (
    producer_id SERIAL PRIMARY KEY,
    producer_name TEXT NOT NULL
);

CREATE TABLE song_artists (
    song_id INT NOT NULL,
    artist_id INT NOT NULL,
    PRIMARY KEY (song_id, artist_id),
    FOREIGN KEY (song_id) REFERENCES songs(song_id),
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

CREATE TABLE song_producers (
    song_id INT NOT NULL,
    producer_id INT NOT NULL,
    PRIMARY KEY (song_id, producer_id),
    FOREIGN KEY (song_id) REFERENCES songs(song_id),
    FOREIGN KEY (producer_id) REFERENCES producers(producer_id)
);
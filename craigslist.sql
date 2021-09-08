-- I spent way too long on the last exercise, (medical_center) and actually enjoyed it, this one, not so much. Bare bones but techincally checks all of the boxes.

DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE post_region (
    id SERIAL PRIMARY KEY,
    post_id INTEGER NOT NULL,
    region TEXT NOT NULL
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    user_name TEXT NOT NULL,
    preferred_region TEXT NOT NULL
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    post_text TEXT NOT NULL,
    poster_user_name TEXT NOT NULL,
    post_location TEXT NOT NULL,
    post_region TEXT NOT NULL
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    post_id INTEGER NOT NULL,
    region TEXT NOT NULL
);

INSERT INTO post_region (post_id, region)
VALUES (1, 'San Francisco');

INSERT INTO users (user_name, preferred_region)
VALUES ('Craig', 'Atlanta');

INSERT INTO posts (
    title, 
    post_text, 
    poster_user_name,
    post_location,
    post_region)
VALUES (
    'Bike For Sale',
    'Bike for sale, $1, come and get it.',
    'Bobby',
    'Seattle',
    'Atlanta'
);

INSERT INTO categories (post_id, region)
VALUES (1, 'Atlanta');
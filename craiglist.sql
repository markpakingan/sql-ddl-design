DROP DATABASE IF EXISTS craigslist; 

CREATE DATABASE craigslist; 

\c craigslist


-- ///////////////////////////////////////////////////////////////////////------
CREATE TABLE Region_list
(
    id SERIAL PRIMARY KEY, 
    region_name TEXT
);

INSERT INTO Region_list
(region_name)
VALUES 
('New York'),
('Los Angeles'),
('San Antonio'),
('San Jose'),
('Chicago');



-- ///////////////////////////////////////////////////////////////////////------
CREATE TABLE User 
(
    id SERIAL PRIMARY KEY, 
    user_name TEXT
);


INSERT INTO User
(user_name)
VALUES 
('Mark'),
('Camille'),
('Kate'),
('Lawrence');


-- ///////////////////////////////////////////////////////////////////////------

CREATE TABLE Categories
(
    id SERIAL PRIMARY KEY, 
    category_name TEXT
);


INSERT INTO Categories
(category_name)
VALUES 
('Fun'),
('Jobs'),
('Community'),
('Housing'),
('Politics');


-- ///////////////////////////////////////////////////////////////////////------

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY, 
    title TEXT, 
    text_description TEXT,
    user_id INTEGER REFERENCES User ON DELETE CASCADE
    location_name TEXT, 
    region_id INTEGER REFERENCES Region_list ON DELETE CASCADE
);

INSERT INTO posts
(title, text_description, user_id, location_name, region_id)
VALUES 
('Pokemon', 'Gotta Catch Them All!', 1, 'West Covina', 1),
('Need a Partner', 'Hello my name is lawrence...', 3, 'Danbury', 2),
('Looking for Internship', 'I am a graduate of BSBA - Marketing', 4, 'Brooklin Hills', 3),
('Need a Home Loan?', 'Are you a first time home buyer? ', 2, 'Down Town Park', 4),
('Catching a Baseball', 'Hey if you are wondering why I am', 1, 'Irvine', 3);

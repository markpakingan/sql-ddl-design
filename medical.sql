DROP DATABASE IF EXISTS medical; 

CREATE DATABASE medical; 

\c medical


-- ///////////////////////////////////////////////////////////////////////------
CREATE TABLE doctor_list 
(
    id SERIAL PRIMARY KEY, 
    doctor_name TEXT, 
    specialty TEXT
);

INSERT INTO doctor_list
(doctor_name, specialty)
VALUES 
('Mario Apple', 'Family Medicine'), 
('Peach Banana', 'Dematology'),
('Luigi Orange', 'Ophtalmology'),
('Bowser Pears', 'Urology'),
('Toad Grapes', 'Psychiatry');




-- ///////////////////////////////////////////////////////////////////////------
CREATE TABLE patient_list 
(
    id SERIAL PRIMARY KEY, 
    patient_name TEXT, 
    birth_date DATE
);


INSERT INTO patient_list
(patient_name, birth_date)
VALUES 
('Pik Pickachu', '1953-06-23'), 
('Char Charmander', '1935-05-31'),
('Bulb Bullbasaur', '1912-04-30'),
('Jig Jiglipuff', '1912-04-30');


-- ///////////////////////////////////////////////////////////////////////------

CREATE TABLE diseases_list 
(
    id SERIAL PRIMARY KEY, 
    disease_name TEXT
);


INSERT INTO diseases_list
(disease_name)
VALUES 
('Allergies'),
('Colds & Flu'),
('Diarrhea'),
('Acne Vulgaris'),
('Chicken pox'),
('E. Coli');


-- ///////////////////////////////////////////////////////////////////////------

CREATE TABLE medical_center 
(
    id SERIAL PRIMARY KEY, 
    doctor_id INTEGER REFERENCES doctor_list ON DELETE CASCADE, 
    patient_id INTEGER REFERENCES patient_list ON DELETE CASCADE,
    diseases_id INTEGER REFERENCES diseases_list ON DELETE CASCADE
);

INSERT INTO medical_center
(doctor_id, patient_id, diseases_id)
VALUES 
(3,1,6),
(5,2,5),
(3,3,4),
(2,2,2), 
(1,2,2);
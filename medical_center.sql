DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctors 
(
    id SERIAL PRIMARY KEY,
    last_name TEXT NOT NULL,
    first_name TEXT NOT NULL,
    gender TEXT NOT NULL,
    age INTEGER NOT NULL,
    position TEXT NOT NULL,    
    hiring_date DATE NOT NULL,
    active_license BOOLEAN DEFAULT true
);

CREATE TABLE patients
(
    id SERIAL PRIMARY KEY,
    last_name TEXT NOT NULL,
    first_name TEXT NOT NULL,
    gender TEXT NOT NULL,
    age INTEGER, -- can be null if unknown
    blood_type TEXT, -- can be null if unknown
    insurance_provider TEXT
    );

CREATE TABLE conditions 
(
    id SERIAL PRIMARY KEY,
    patient_id INTEGER NOT NULL REFERENCES patients ON DELETE SET NULL,
    diagnosing_doctor_id INTEGER NOT NULL REFERENCES doctors ON DELETE SET NULL,
    diagnosis_date DATE,
    condition_name_medical TEXT NOT NULL,
    condition_name_common TEXT NOT NULL,
    terminal BOOLEAN
    -- Considered adding prescriptions, but that would require another table.   
);

CREATE TABLE doctors_patients_conditions 
(
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER NOT NULL REFERENCES doctors ON DELETE SET NULL,
    patient_id INTEGER NOT NULL REFERENCES patients ON DELETE SET NULL,
    condition_id INTEGER NOT NULL REFERENCES conditions ON DELETE SET NULL
);

INSERT INTO doctors (last_name, first_name, gender, age, position, hiring_date, active_license)
VALUES ('Smith', 'Zachary', 'Male', '60', 'MD', '1962-01-01', true);

INSERT INTO patients (last_name, first_name, gender, age, blood_type, insurance_provider)
VALUES ('Robinson', 'Will', 'Male', '12', NULL, 'Alpha Control Medical');

INSERT INTO conditions (patient_id, diagnosing_doctor_id, diagnosis_date, condition_name_medical, condition_name_common, terminal)
VALUES (1, 1, '1962-01-01', 'Bacterium Infection', 'Spot on tongue Syndrome', true);

INSERT INTO doctors_patients_conditions (doctor_id, patient_id, condition_id)
VALUES (1, 1, 1);


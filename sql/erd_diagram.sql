CREATE DATABASE hospital_db_dev;

USE hospital_db_dev;

CREATE TABLE hospital (
    id INT NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE patient (
    id INT NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone_number VARCHAR(20),
    blood_type VARCHAR(20),
    weight VARCHAR(20)
);

CREATE TABLE employee (
    id INT NOT NULL PRIMARY KEY,
    first_name INT NOT NULL,
    last_name INT NOT NULL,
    phone_number INT
);
    
CREATE TABLE role (
    id INT NOT NULL PRIMARY KEY,
    role_type VARCHAR(50)
);

CREATE TABLE disease (
    id INT NOT NULL PRIMARY KEY,
    name VARCHAR(50),
    treatable VARCHAR(20)
);

CREATE TABLE treatment (
    id INT NOT NULL PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE disease_treatment (
    id INT NOT NULL PRIMARY KEY,
    disease_id INT,
    treatment_id INT,

    FOREIGN KEY (disease_id)
        REFERENCES disease(id),

    FOREIGN KEY (treatment_id)
        REFERENCES treatment(id)
);

CREATE TABLE room_type (
    id INT NOT NULL PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE room (
    id INT NOT NULL PRIMARY KEY,
    room_type_id INT,
    hospital_id INT NOT NULL,

    FOREIGN KEY (room_type_id)
      REFERENCES room_type(id),

    FOREIGN KEY (hospital_id)
      REFERENCES hospital(id)
);

CREATE TABLE patient_room (
    id INT NOT NULL PRIMARY KEY,
    room_id INT NOT NULL,
    patient_id INT NOT NULL,

    FOREIGN KEY (room_id)
      REFERENCES room(id),

    FOREIGN KEY (patient_id)
      REFERENCES patient(id)
);
    
CREATE TABLE appointment (
    id INT NOT NULL PRIMARY KEY,
    employee_id INT,
    patient_id INT,

    FOREIGN KEY (employee_id)
      REFERENCES employee(id),

    FOREIGN KEY (patient_id)
      REFERENCES patient(id)
);

CREATE TABLE employee_role (
    id INT NOT NULL PRIMARY KEY,
    role_id INT NOT NULL,
    employee_id INT NULL,

    FOREIGN KEY (role_id)
        REFERENCES role(id),

    FOREIGN KEY (employee_id)
        REFERENCES employee(id)
);

CREATE TABLE diagnosis (
    id INT NOT NULL PRIMARY KEY,
    patient_id INT,
    disease_id INT,
    employee_id INT,

    FOREIGN KEY (patient_id)
        REFERENCES patient(id),

    FOREIGN KEY (disease_id)
        REFERENCES disease(id),

    FOREIGN KEY (employee_id)
        REFERENCES employee(id)
);

CREATE TABLE diagnosis_disease (
    id INT NOT NULL PRIMARY KEY,
    diagnosis_id INT,
    disease_id INT,

    FOREIGN KEY (diagnosis_id)
        REFERENCES diagnosis(id),

    FOREIGN KEY (disease_id)
        REFERENCES disease(id)
);
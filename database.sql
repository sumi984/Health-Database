CREATE DATABASE health_tracker;
USE health_tracker;

-- Create the person table
CREATE TABLE person (
    person_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    dob DATE NOT NULL,
    account_id VARCHAR(50) NOT NULL,
    phone_number VARCHAR(15),
    email VARCHAR(100)
);

-- Create the address table
CREATE TABLE address (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    city VARCHAR(100),
    state VARCHAR(100),
    pin_code VARCHAR(10)
);

-- Create the health_tracker table
CREATE TABLE health_tracker (
    tracker_id INT AUTO_INCREMENT PRIMARY KEY,
    person_id INT,
    bp VARCHAR(50),
    diet VARCHAR(100),
    exercise VARCHAR(100),
    blood_sugar VARCHAR(50),
    sleep_hours INT,
    water_drank INT,
    FOREIGN KEY (person_id) REFERENCES person(person_id)
);

-- Create the disease table
CREATE TABLE disease (
    disease_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    code VARCHAR(50)
);

-- Create the hospital table
CREATE TABLE hospital (
    hospital_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    address VARCHAR(255)
);

-- Create the relationship table for person and address (many-to-many)
CREATE TABLE person_address (
    person_id INT,
    address_id INT,
    PRIMARY KEY (person_id, address_id),
    FOREIGN KEY (person_id) REFERENCES person(person_id),
    FOREIGN KEY (address_id) REFERENCES address(address_id)
);

-- Create the relationship table for person and disease (many-to-many)
CREATE TABLE person_disease (
    person_id INT,
    disease_id INT,
    PRIMARY KEY (person_id, disease_id),
    FOREIGN KEY (person_id) REFERENCES person(person_id),
    FOREIGN KEY (disease_id) REFERENCES disease(disease_id)
);

-- Create the relationship table for disease and hospital (many-to-many)
CREATE TABLE disease_hospital (
    disease_id INT,
    hospital_id INT,
    PRIMARY KEY (disease_id, hospital_id),
    FOREIGN KEY (disease_id) REFERENCES disease(disease_id),
    FOREIGN KEY (hospital_id) REFERENCES hospital(hospital_id)
);

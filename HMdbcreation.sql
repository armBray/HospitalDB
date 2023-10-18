create database HospitalManagement;
use HospitalManagement;
CREATE TABLE Patient (
    email VARCHAR(50) PRIMARY KEY,
    password VARCHAR(50) NOT NULL,
    name VARCHAR(50) NOT NULL,
    address VARCHAR(50) NOT NULL,
    gender VARCHAR(50) NOT NULL
);

ALTER TABLE Patient
ADD phone_number VARCHAR(50);

ALTER TABLE Patient
MODIFY COLUMN address VARCHAR(70)
AFTER gender;

ALTER TABLE Patient
MODIFY COLUMN name VARCHAR(70),
MODIFY COLUMN address VARCHAR(70),
MODIFY COLUMN gender VARCHAR(70);

CREATE TABLE MedicalHistory (
    id INT PRIMARY KEY,
    date DATE NOT NULL,
    conditions VARCHAR(100) NOT NULL,
    surgeries VARCHAR(100) NOT NULL,
    medication VARCHAR(100) NOT NULL
);

CREATE TABLE Doctor (
    email VARCHAR(50) PRIMARY KEY,
    password VARCHAR(50) NOT NULL,
    name VARCHAR(50) NOT NULL,
    gender VARCHAR(50) NOT NULL
);

CREATE TABLE Appointment (
    id INT PRIMARY KEY,
    date DATE NOT NULL,
    startime TIME NOT NULL,
    endtime TIME NOT NULL,
    status VARCHAR(20) NOT NULL
);

CREATE TABLE PatientAttendAppointment (
    patient VARCHAR(50) NOT NULL,
    appointment INT NOT NULL,
    concerns VARCHAR(50) NOT NULL,
    symptoms VARCHAR(50) NOT NULL,
    FOREIGN KEY (patient)
        REFERENCES Patient (email)
        ON DELETE CASCADE,
    FOREIGN KEY (appointment)
        REFERENCES Appointment (id)
        ON DELETE CASCADE,
    PRIMARY KEY (patient , appointment)
);

create table Schedules (
    id INT NOT NULL,
    startime TIME NOT NULL,
    endtime TIME NOT NULL,
    breaktime TIME NOT NULL,
    day VARCHAR(50) NOT NULL,
    PRIMARY KEY (id,startime,endtime,breaktime,day)
);

CREATE TABLE PatientFillHistory (
    patient VARCHAR(50) NOT NULL,
    history INT NOT NULL,
    FOREIGN KEY (history) REFERENCES MedicalHistory (id) ON DELETE CASCADE,
    PRIMARY KEY (history)
);

CREATE TABLE Diagnose (
    appointment INT NOT NULL,
    doctor VARCHAR(50) NOT NULL,
    diagnosis VARCHAR(50) NOT NULL,
    prescription VARCHAR(50) NOT NULL,
    FOREIGN KEY (appointment) REFERENCES Appointment (id) ON DELETE CASCADE,
    FOREIGN KEY (doctor) REFERENCES Doctor (email) ON DELETE CASCADE,
    PRIMARY KEY (appointment,doctor)
);

CREATE TABLE DoctorsViewHistory (
    history INT NOT NULL,
    doctor VARCHAR(50) NOT NULL,
    FOREIGN KEY (history) REFERENCES MedicalHistory (id) ON DELETE CASCADE,
    FOREIGN KEY (doctor) REFERENCES Doctor (email) ON DELETE CASCADE,
    PRIMARY KEY (history,doctor)
);

CREATE TABLE DoctorsHaveSchedule (
    schedule INT NOT NULL,
    doctor VARCHAR(50) NOT NULL,
    FOREIGN KEY (schedule) REFERENCES Schedules (id) ON DELETE CASCADE,
    FOREIGN KEY (doctor) REFERENCES Doctor (email) ON DELETE CASCADE,
    PRIMARY KEY (schedule,doctor)
);

SELECT * FROM Doctor LIMIT 10;


































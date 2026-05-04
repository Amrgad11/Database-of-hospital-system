CREATE TABLE department (
    dep_id       NUMBER(5)    PRIMARY KEY,
    floor_number NUMBER(2)    NOT NULL,
    dep_name     VARCHAR2(50) NOT NULL
);
CREATE TABLE room (
    room_number   VARCHAR2(5)  PRIMARY KEY,
    room_type     VARCHAR2(10) CHECK (room_type IN ('Single', 'Double', 'Suite')),
    dep_id        NUMBER       REFERENCES department(dep_id),
    floor_number  NUMBER(2)    NOT NULL,
    status        VARCHAR2(10) CHECK (status IN ('Available', 'Occupied', 'Maintenance')),
    capacity_room NUMBER(1)    CHECK (capacity_room <= 5)
);
CREATE TABLE patient (
    patient_id    NUMBER(5)    PRIMARY KEY,
    room_number   VARCHAR2(5)  REFERENCES room(room_number),
    date_birth    DATE,
    name_patient  VARCHAR2(50) NOT NULL,
    phone_number  NUMBER(11) NOT NULL UNIQUE,
    diagnose_date DATE,gendr VARCHAR2(5)CHECK(gendr IN('f','m')),
    cancer_type   VARCHAR2(25),
    blood_type    VARCHAR2(3)  CHECK (blood_type IN ('A+','A-','B+','B-','AB+','AB-','O+','O-')),
    address       VARCHAR2(60) NOT NULL
);
CREATE TABLE employees(
emp_id NUMBER(5) PRIMARY KEY,
dep_id  NUMBER(5) REFERENCES department(dep_id),name_emp VARCHAR2(25) not NULL
,jop_tittle VARCHAR2(30) not null,salary NUMBER(5) NOT null,shift VARCHAR2(10) CHECK(shift IN('moring','eveing')),
phone_number number (11) UNIQUE NOT NULL
);
CREATE TABLE  doctor(
doctor_id NUMBER (5) PRIMARY KEY, name_docter VARCHAR2(25) NOT NULL,
dep_id NUMBER (5) REFERENCES department(dep_id),gendr VARCHAR2(5)CHECK(gendr IN('f','m')),
salary NUMBER NOT null,hire_data DATE not null,specially VARCHAR2(30) not null,phone NUMBER(11) UNIQUE
);
CREATE TABLE operation (
operation_id NUMBER(5) PRIMARY KEY,
 patient_id    NUMBER(5) REFERENCES patient(patient_id), doctor_id NUMBER (5) REFERENCES doctor(doctor_id),
 operation_name VARCHAR2(50) not null,operation_date DATE not NULL,operation_time VARCHAR2(5) CHECK (operation_time LIKE '__:__'),
 
 status VARCHAR2(25) CHECK (status IN ('Completed', 'Scheduled')),
 cost_ope NUMBER(6) not NULL 
);
CREATE TABLE visit(
visit_id NUMBER (5)PRIMARY KEY, patient_id    NUMBER(5) REFERENCES patient(patient_id),
vistor_name  VARCHAR2(50) not null,vist_date DATE not null, vistor_relation VARCHAR2(30) not NULL,
enter_time VARCHAR2(5) CHECK (enter_time LIKE '__:__'),exit_time VARCHAR2(5) CHECK (exit_time LIKE '__:__'),
phone NUMBER(11) not null UNIQUE
);

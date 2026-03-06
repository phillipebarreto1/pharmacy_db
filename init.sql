CREATE DATABASE pharmacy_db;
\c pharmacy_db

CREATE USER pharmacy_user WITH PASSWORD '1';
GRANT ALL PRIVILEGES ON DATABASE pharmacy_db TO pharmacy_user;

CREATE SEQUENCE manufacturer_seq START 1;
CREATE SEQUENCE doctor_seq START 1;
CREATE SEQUENCE supplier_seq START 1;
CREATE SEQUENCE medicine_seq START 1;
CREATE SEQUENCE patient_seq START 1;
CREATE SEQUENCE patient_medication_seq START 1;

CREATE TABLE manufacturers (
  manufacturer_id INTEGER NOT NULL DEFAULT nextval('manufacturer_seq'),
  name            VARCHAR(128) NOT NULL,
  street_address  VARCHAR(256) NOT NULL,
  city            VARCHAR(64)  NOT NULL,
  state           VARCHAR(32)  NOT NULL,
  zip             VARCHAR(16)  NOT NULL,
  phone           VARCHAR(16)  NOT NULL,
  PRIMARY KEY     ( manufacturer_id )
);

CREATE TABLE doctors (
  doctor_id       INTEGER NOT NULL DEFAULT nextval('doctor_seq'),
  first_name      VARCHAR(64)  NOT NULL,
  last_name       VARCHAR(64)  NOT NULL,
  phone           VARCHAR(16)  NOT NULL,
  license_number  VARCHAR(32)  NOT NULL,
  PRIMARY KEY     ( doctor_id )
);

CREATE TABLE suppliers (
  supplier_id     INTEGER NOT NULL DEFAULT nextval('supplier_seq'),
  name            VARCHAR(128) NOT NULL,
  street_address  VARCHAR(256) NOT NULL,
  city            VARCHAR(64)  NOT NULL,
  state           VARCHAR(32)  NOT NULL,
  zip             VARCHAR(16)  NOT NULL,
  phone           VARCHAR(16)  NOT NULL,
  manufacturer_id INTEGER NOT NULL,
  PRIMARY KEY     ( supplier_id ),
  CONSTRAINT fk_supplier_manufacturer
    FOREIGN KEY (manufacturer_id) REFERENCES manufacturers(manufacturer_id)
);

CREATE TABLE medicines (
  medicine_id     INTEGER NOT NULL DEFAULT nextval('medicine_seq'),
  name_dosage     VARCHAR(128) NOT NULL,
  category        VARCHAR(64)  NOT NULL,
  sale_price      NUMERIC(10,2) NOT NULL,
  stock_on_hand   INTEGER NOT NULL,
  manufacturer_id INTEGER NOT NULL,
  PRIMARY KEY     ( medicine_id ),
  CONSTRAINT fk_medicine_manufacturer
    FOREIGN KEY (manufacturer_id) REFERENCES manufacturers(manufacturer_id)
);

CREATE TABLE patients (
  patient_id        INTEGER NOT NULL DEFAULT nextval('patient_seq'),
  first_name        VARCHAR(64)  NOT NULL,
  last_name         VARCHAR(64)  NOT NULL,
  street_address    VARCHAR(256) NOT NULL,
  city              VARCHAR(64)  NOT NULL,
  state             VARCHAR(32)  NOT NULL,
  zip               VARCHAR(16)  NOT NULL,
  phone             VARCHAR(16)  NOT NULL,
  primary_doctor_id INTEGER NOT NULL,
  PRIMARY KEY       ( patient_id ),
  CONSTRAINT fk_patient_doctor
    FOREIGN KEY (primary_doctor_id) REFERENCES doctors(doctor_id)
);

CREATE TABLE patient_medications (
  patient_medication_id INTEGER NOT NULL DEFAULT nextval('patient_medication_seq'),
  patient_id             INTEGER NOT NULL,
  medicine_id            INTEGER NOT NULL,
  start_date             DATE NOT NULL,
  notes                  VARCHAR(256) NOT NULL,
  PRIMARY KEY            ( patient_medication_id ),
  CONSTRAINT fk_pm_patient
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
  CONSTRAINT fk_pm_medicine
    FOREIGN KEY (medicine_id) REFERENCES medicines(medicine_id)
);

GRANT ALL PRIVILEGES ON manufacturers, doctors, suppliers, medicines, patients, patient_medications TO pharmacy_user;
GRANT ALL PRIVILEGES ON SEQUENCE manufacturer_seq TO pharmacy_user;
GRANT ALL PRIVILEGES ON SEQUENCE doctor_seq TO pharmacy_user;
GRANT ALL PRIVILEGES ON SEQUENCE supplier_seq TO pharmacy_user;
GRANT ALL PRIVILEGES ON SEQUENCE medicine_seq TO pharmacy_user;
GRANT ALL PRIVILEGES ON SEQUENCE patient_seq TO pharmacy_user;
GRANT ALL PRIVILEGES ON SEQUENCE patient_medication_seq TO pharmacy_user;
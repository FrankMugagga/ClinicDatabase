/* CLINIC DATABASE*/
CREATE DATABASE CLINIC;
CREATE TABLE PATIENTS(ID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, NAME VARCHAR(100), DATE_OF_BIRTH DATE);
CREATE TABLE MEDICAL_HISTORIES(ID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, ADMITTED_AT TIMESTAMP, PATIENT_ID INT, STATUS VARCHAR(10), CONSTRAINT FK_PATIENT FOREIGN KEY(PATIENT_ID) REFERENCES PATIENTS(ID));
CREATE TABLE INVOICES(ID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, TOTAL_AMOUNT DECIMAL, GENERATED_AT TIMESTAMP, PAYED_AT TIMESTAMP, MEDICAL_HISTORY_ID INT, CONSTRAINT FK_MEDICALHISTORIES FOREIGN KEY (MEDICAL_HISTORY_ID) REFERENCES MEDICAL_HISTORIES(ID));
CREATE TABLE TREATMENTS(ID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, TYPE VARCHAR(50), NAME VARCHAR(100));
CREATE TABLE INVOICE_ITEMS(ID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, UNIT_PRICE DECIMAL, QUANTITY INT, TOTAL_PRICE DECIMAL, INVOICE_ID INT, TREATMENT_ID INT, CONSTRAINT FK_INVOICES FOREIGN KEY(INVOICE_ID) REFERENCES INVOICES(ID), CONSTRAINT FK_TREATMENTS FOREIGN KEY(TREATMENT_ID)
REFERENCES TREATMENTS(ID));
CREATE TABLE TREATMENT_HISTORIES(ID INT GENERATED ALWAYS AS IDENTITY, TREATMENTS_ID INT, MEDICAL_HISTORIES_ID I
NT, CONSTRAINT FK_TREATMENTS FOREIGN KEY(TREATMENTS_ID) REFERENCES TREATMENTS(ID), CONSTRAINT FK_MEDICALHISTORIES FOREIG
N KEY(MEDICAL_HISTORIES_ID) REFERENCES MEDICAL_HISTORIES(ID));


 
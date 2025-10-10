-- ========================
-- DATABASE
-- ========================
CREATE DATABASE teleexpertise;
\c teleexpertise;

-- ========================
-- TABLE PATIENTS
-- ========================
CREATE TABLE patients
(
    id         VARCHAR(50) PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name  VARCHAR(100) NOT NULL,
    birth_date DATE,
    gender     VARCHAR(10),
    phone      VARCHAR(20),
    address    TEXT,
    numero_ss  VARCHAR(20) UNIQUE,
    mutuelle   VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ========================
-- TABLE MEDICAL RECORDS
-- ========================
CREATE TABLE medical_records
(
    id          VARCHAR(50) PRIMARY KEY,
    patient_id  VARCHAR(50) NOT NULL REFERENCES patients(id) ON DELETE CASCADE ON UPDATE CASCADE,
    title       VARCHAR(200),
    description TEXT,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ========================
-- TABLE ALLERGIES
-- ========================
CREATE TABLE allergies
(
    id           VARCHAR(50) PRIMARY KEY,
    record_id    VARCHAR(50) NOT NULL REFERENCES medical_records(id) ON DELETE CASCADE ON UPDATE CASCADE,
    allergy_name VARCHAR(150) NOT NULL,
    severity     VARCHAR(50),
    notes        TEXT
);

-- ========================
-- TABLE TREATMENTS
-- ========================
CREATE TABLE treatments
(
    id             VARCHAR(50) PRIMARY KEY,
    record_id      VARCHAR(50) NOT NULL REFERENCES medical_records(id) ON DELETE CASCADE ON UPDATE CASCADE,
    treatment_name VARCHAR(150) NOT NULL,
    dosage         VARCHAR(100),
    start_date     DATE,
    end_date       DATE,
    notes          TEXT
);

-- ========================
-- TABLE ANTECEDENTS
-- ========================
CREATE TABLE antecedent
(
    id              VARCHAR(50) PRIMARY KEY,
    record_id       VARCHAR(50) NOT NULL REFERENCES medical_records(id) ON DELETE CASCADE ON UPDATE CASCADE,
    type_antecedent VARCHAR(100) NOT NULL,
    description     TEXT,
    date_diagnostic DATE,
    statut          VARCHAR(50)
);

-- ========================
-- TABLE VITAL SIGNS
-- ========================
CREATE TABLE vital_signs
(
    id                       VARCHAR(50) PRIMARY KEY,
    record_id                VARCHAR(50) NOT NULL REFERENCES medical_records(id) ON DELETE CASCADE ON UPDATE CASCADE,
    measured_at              TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    temperature              NUMERIC(4, 1),
    heart_rate               INT,
    blood_pressure_systolic  INT,
    blood_pressure_diastolic INT,
    respiratory_rate         INT,
    oxygen_saturation        NUMERIC(4, 1),
    weight                   NUMERIC(5, 2),
    height                   NUMERIC(5, 2),
    notes                    TEXT
);

-- ========================
-- TABLE ROLES
-- ========================
CREATE TABLE roles
(
    id          VARCHAR(50) PRIMARY KEY,
    name        VARCHAR(50) UNIQUE NOT NULL,
    description TEXT
);

-- ========================
-- TABLE SPECIALTIES
-- ========================
CREATE TABLE specialties
(
    id          VARCHAR(50) PRIMARY KEY,
    name        VARCHAR(100) UNIQUE NOT NULL,
    description TEXT
);

-- ========================
-- TABLE USERS
-- ========================
CREATE TABLE users
(
    id            VARCHAR(50) PRIMARY KEY,
    role_id       VARCHAR(50) NOT NULL REFERENCES roles(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    specialty_id  VARCHAR(50) REFERENCES specialties(id) ON DELETE SET NULL ON UPDATE CASCADE,
    first_name    VARCHAR(100) NOT NULL,
    last_name     VARCHAR(100) NOT NULL,
    email         VARCHAR(150) UNIQUE NOT NULL,
    phone         VARCHAR(20),
    password_hash VARCHAR(255) NOT NULL,
    address       TEXT,
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    active        BOOLEAN DEFAULT TRUE
);

-- ========================
-- TABLE ATTACHMENTS
-- ========================
CREATE TABLE attachments
(
    id          VARCHAR(50) PRIMARY KEY,
    record_id   VARCHAR(50) NOT NULL REFERENCES medical_records(id) ON DELETE CASCADE ON UPDATE CASCADE,
    file_path   TEXT NOT NULL,
    file_type   VARCHAR(50),
    uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ========================
-- TABLE CONSULTATIONS
-- ========================
CREATE TABLE consultations
(
    id                VARCHAR(50) PRIMARY KEY,
    record_id         VARCHAR(50) NOT NULL REFERENCES patients(id) ON DELETE CASCADE ON UPDATE CASCADE,
    generalist_id     VARCHAR(50) NOT NULL REFERENCES users(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    consultation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    motive            TEXT NOT NULL,
    observations      TEXT,
    diagnosis         TEXT,
    treatment         TEXT,
    status            VARCHAR(30) DEFAULT 'EN_COURS',
    cost              NUMERIC(10, 2) DEFAULT 150.00,
    priority          VARCHAR(20) DEFAULT 'NORMALE',
    updated_at        TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ========================
-- TABLE REQUETES
-- ========================
CREATE TABLE requetes
(
    id_requete          VARCHAR(50) PRIMARY KEY,
    id_medecin_emetteur VARCHAR(50) NOT NULL REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
    id_medecin_expert   VARCHAR(50) NOT NULL REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
    id_record           VARCHAR(50) NOT NULL REFERENCES medical_records(id) ON DELETE CASCADE ON UPDATE CASCADE,
    id_consultation     VARCHAR(50) REFERENCES consultations(id) ON DELETE SET NULL ON UPDATE CASCADE,
    date_creation       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    objet               VARCHAR(255),
    description         TEXT,
    etat                VARCHAR(50) DEFAULT 'En attente',
    priorite            VARCHAR(20) DEFAULT 'Normale',
    date_reponse        TIMESTAMP,
    commentaire_expert  TEXT
);

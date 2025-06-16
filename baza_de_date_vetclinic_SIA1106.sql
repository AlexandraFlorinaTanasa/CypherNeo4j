DROP TABLE IF EXISTS AppointmentServiceLink CASCADE;
DROP TABLE IF EXISTS AppointmentService CASCADE;
DROP TABLE IF EXISTS Appointment CASCADE;
DROP TABLE IF EXISTS PetAllergies CASCADE;
DROP TABLE IF EXISTS Pet CASCADE;
DROP TABLE IF EXISTS Breed CASCADE;
DROP TABLE IF EXISTS Species CASCADE;
DROP TABLE IF EXISTS Client CASCADE;
DROP TABLE IF EXISTS Veterinarian CASCADE;
DROP TABLE IF EXISTS Product CASCADE;
DROP TABLE IF EXISTS Supplier CASCADE;
DROP TABLE IF EXISTS Clinic CASCADE;
DROP TABLE IF EXISTS Diagnosis CASCADE;
DROP TABLE IF EXISTS TreatmentPlan CASCADE;
DROP TABLE IF EXISTS PrescribedTreatment CASCADE;
DROP TABLE IF EXISTS AdministeredTreatment CASCADE;
DROP TABLE IF EXISTS TreatmentClinic CASCADE;
DROP TABLE IF EXISTS HomeTreatment CASCADE;
DROP TABLE IF EXISTS SupplyEntry CASCADE;
DROP TABLE IF EXISTS Invoice CASCADE;
DROP TABLE IF EXISTS Payment CASCADE;
DROP TABLE IF EXISTS Discount CASCADE;
DROP TABLE IF EXISTS InvoiceLine CASCADE; 
DROP TABLE IF EXISTS MedicalHistory CASCADE;

-- Clinic
CREATE TABLE Clinic (
    clinicID INTEGER PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    address VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(50)
);

-- Supplier
CREATE TABLE Supplier (
    supplierID INTEGER PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    address VARCHAR(50),
    email VARCHAR(30),
    phone VARCHAR(15)
);
-- Product
CREATE TABLE Product (
    productID INTEGER PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    price NUMERIC(10, 2),
    stock INTEGER DEFAULT 0, 
    supplierID INTEGER NOT NULL,
    clinicID INTEGER NOT NULL,
    lotNumber VARCHAR(20),
    expiryDate DATE,
	reorderThreshold INTEGER DEFAULT 10 CHECK (reorderThreshold > 0),
	storageCondition VARCHAR(20) CHECK (storageCondition IN ('refrigerated', 'room temperature', 'frozen')) DEFAULT 'room temperature',
    FOREIGN KEY (supplierID) REFERENCES Supplier(supplierID),
    FOREIGN KEY (clinicID) REFERENCES Clinic(clinicID)
);
-- Species
CREATE TABLE Species (
    speciesID INTEGER PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- Breed
CREATE TABLE Breed (
    breedID INTEGER PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    speciesID INTEGER NOT NULL,
    FOREIGN KEY (speciesID) REFERENCES Species(speciesID)
);
-- Client
CREATE TABLE Client (
    clientID INTEGER PRIMARY KEY,
    firstName VARCHAR(20) NOT NULL,
    lastName VARCHAR(20) NOT NULL,
    email VARCHAR(30),
    phone VARCHAR(15),
    address VARCHAR(100)
);

-- Pet
CREATE TABLE Pet (
    petID INTEGER PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    dateOfBirth DATE,
    microchipID VARCHAR(15),
    clientID INTEGER NOT NULL,
    breedID INTEGER NOT NULL,
    weight NUMERIC(5, 2),
	gender CHAR(1) CHECK (gender IN ('M', 'F', 'U')) DEFAULT 'U',
	neutered BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (clientID) REFERENCES Client(clientID),
    FOREIGN KEY (breedID) REFERENCES Breed(breedID)
);

-- Pet Allergies
CREATE TABLE PetAllergies (
    petAllergyID INTEGER PRIMARY KEY,
    petID INTEGER NOT NULL,
    allergyDescription VARCHAR(255),
    FOREIGN KEY (petID) REFERENCES Pet(petID)
);
-- Veterinarian
CREATE TABLE Veterinarian (
    vetID INTEGER PRIMARY KEY,
    firstName VARCHAR(20) NOT NULL,
    lastName VARCHAR(20) NOT NULL,
    email VARCHAR(30),
    phone VARCHAR(15),
    specialization VARCHAR(50),
    clinicID INTEGER,
    FOREIGN KEY (clinicID) REFERENCES Clinic(clinicID)
);

-- Appointment
CREATE TABLE Appointment (
    appointmentID INTEGER PRIMARY KEY,
    appointmentDate DATE NOT NULL,
  	appointmentTime TIME CHECK (appointmentTime BETWEEN '08:00:00' AND '20:00:00'),
    petID INTEGER NOT NULL,
    vetID INTEGER NOT NULL,
    clinicID INTEGER NOT NULL,
	 status VARCHAR(15) CHECK (status IN ('scheduled', 'completed', 'cancelled')) DEFAULT 'scheduled',
    FOREIGN KEY (petID) REFERENCES Pet(petID),
    FOREIGN KEY (vetID) REFERENCES Veterinarian(vetID),
    FOREIGN KEY (clinicID) REFERENCES Clinic(clinicID)
);
-- Appointment services
CREATE TABLE AppointmentService (
    serviceID INTEGER PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(255),
    baseFee NUMERIC(10, 2) NOT NULL,
    durationMinutes INTEGER
);

-- AppointmentServiceLink
CREATE TABLE AppointmentServiceLink (
    appointmentServiceLinkID INTEGER PRIMARY KEY,
    appointmentID INTEGER NOT NULL,
    serviceID INTEGER NOT NULL,
    feeApplied NUMERIC(10, 2) NOT NULL,
    FOREIGN KEY (appointmentID) REFERENCES Appointment(appointmentID),
    FOREIGN KEY (serviceID) REFERENCES AppointmentService(serviceID)
);
-- Diagnosis
CREATE TABLE Diagnosis (
    diagnosisID INTEGER PRIMARY KEY,
    description VARCHAR(255),
    appointmentID INTEGER NOT NULL,
    FOREIGN KEY (appointmentID) REFERENCES Appointment(appointmentID)
);

-- TreatmentPlan
CREATE TABLE TreatmentPlan (
    planID INTEGER PRIMARY KEY,
    petID INTEGER NOT NULL,
    description VARCHAR(255),
	isActive BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (petID) REFERENCES Pet(petID)
);

-- Prescribed Treatment
CREATE TABLE PrescribedTreatment (
    prescribedTreatmentID INTEGER PRIMARY KEY,
    treatmentName VARCHAR(50) NOT NULL,
    dosage INTEGER,
    productID INTEGER NOT NULL,
    appointmentID INTEGER NOT NULL,
    planID INTEGER,
    FOREIGN KEY (productID) REFERENCES Product(productID),
    FOREIGN KEY (appointmentID) REFERENCES Appointment(appointmentID),
    FOREIGN KEY (planID) REFERENCES TreatmentPlan(planID)
);

-- Administered Treatment
CREATE TABLE AdministeredTreatment (
    administeredTreatmentID INTEGER PRIMARY KEY,
    prescribedTreatmentID INTEGER NOT NULL,
    dateAdministered DATE NOT NULL,
    location VARCHAR(50) NOT NULL CHECK (location IN ('clinic', 'home')),
    FOREIGN KEY (prescribedTreatmentID) REFERENCES PrescribedTreatment(prescribedTreatmentID)
);
-- TreatmentClinic
CREATE TABLE TreatmentClinic (
    treatmentClinicID INTEGER PRIMARY KEY,
    administeredTreatmentID INTEGER NOT NULL,
    clinicID INTEGER NOT NULL,
    FOREIGN KEY (administeredTreatmentID) REFERENCES AdministeredTreatment(administeredTreatmentID),
    FOREIGN KEY (clinicID) REFERENCES Clinic(clinicID)
);

-- HomeTreatment
CREATE TABLE HomeTreatment (
    homeTreatmentID INTEGER PRIMARY KEY,
    administeredTreatmentID INTEGER NOT NULL,
    address VARCHAR(100) NOT NULL,
    FOREIGN KEY (administeredTreatmentID) REFERENCES AdministeredTreatment(administeredTreatmentID)
);
CREATE TABLE MedicalHistory (
    historyID INTEGER PRIMARY KEY,
    petID INTEGER NOT NULL,
    dateOfRecord DATE NOT NULL,
    type VARCHAR(50) NOT NULL CHECK (type IN ('diagnosis', 'treatment', 'vaccine')),
    description VARCHAR(255),
    FOREIGN KEY (petID) REFERENCES Pet(petID)
);


-- Discount
CREATE TABLE Discount (
    discountID INTEGER PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(255),
    percentage NUMERIC(5, 2),
    startDate DATE NOT NULL,
    endDate DATE NOT NULL,
    isActive BOOLEAN DEFAULT TRUE
);

-- Invoice
CREATE TABLE Invoice (
    invoiceID INTEGER PRIMARY KEY,
    totalAmount NUMERIC(10, 2) NOT NULL,
    appointmentID INTEGER NOT NULL,
    discountID INTEGER,
    FOREIGN KEY (appointmentID) REFERENCES Appointment(appointmentID),
    FOREIGN KEY (discountID) REFERENCES Discount(discountID)
);
CREATE TABLE InvoiceLine (
    invoiceLineID INTEGER PRIMARY KEY,
    invoiceID INTEGER NOT NULL,
    description VARCHAR(255),
    quantity INTEGER NOT NULL,
    unitPrice NUMERIC(10, 2),
    lineTotal NUMERIC(10, 2) GENERATED ALWAYS AS (quantity * unitPrice) STORED,
    FOREIGN KEY (invoiceID) REFERENCES Invoice(invoiceID)
);

-- Payment
CREATE TABLE Payment (
    paymentID INTEGER PRIMARY KEY,
    paymentDate DATE NOT NULL,
    paymentMethod VARCHAR(30),
    invoiceID INTEGER NOT NULL,
    amount NUMERIC(10, 2),
    FOREIGN KEY (invoiceID) REFERENCES Invoice(invoiceID)
);
-- SupplyEntry
CREATE TABLE SupplyEntry (
    entryID INTEGER PRIMARY KEY,
    productID INTEGER NOT NULL,
    supplierID INTEGER NOT NULL,
    dateReceived DATE NOT NULL,
    quantity INTEGER NOT NULL,
    pricePerUnit NUMERIC(10, 2) NOT NULL,
    FOREIGN KEY (productID) REFERENCES Product(productID),
    FOREIGN KEY (supplierID) REFERENCES Supplier(supplierID)
);

CREATE TABLE Company(
    companyID           INTEGER UNIQUE NOT NULL,
    companyName          CHAR(100) NOT NULL,
    noCars              INTEGER NOT NULL,
    noDrivers           INTEGER NOT NULL,
    companyAddr         CHAR(100) UNIQUE NOT NULL,
    PRIMARY KEY (companyID)
);

CREATE TABLE Incident(
    eventNo             INTEGER UNIQUE NOT NULL,
    noCars              INTEGER NOT NULL,
    eventTime           TIMESTAMP NOT NULL,
    eventLoc            CHAR(100) NOT NULL,
    PRIMARY KEY (eventNo)
);

CREATE TABLE Bill(
    invoiceNo           INTEGER UNIQUE NOT NULL,
    amount              INTEGER NOT NULL,
    coverage            CHAR(100) NOT NULL,
    PRIMARY KEY (invoiceNo)
);

CREATE TABLE Insurance(
    policyNo            INTEGER UNIQUE NOT NULL,
    cost                INTEGER NOT NULL,
    coverage            CHAR(100) NOT NULL,
    PRIMARY KEY (policyNo)
);

CREATE TABLE License(
    licenseNo           INTEGER UNIQUE NOT NULL,
    licenceClass        INTEGER NOT NULL,
    restrictions        CHAR(100),
    PRIMARY KEY (licenseNo)
);

CREATE TABLE CarOwner(
    licenseNo           INTEGER UNIQUE NOT NULL,
    ownerName           CHAR(20) UNIQUE NOT NULL,
    age                 INTEGER NOT NULL,
    noCars              INTEGER NOT NULL,
    PRIMARY KEY (licenseNo, ownerName),
    FOREIGN KEY (licenseNo) REFERENCES License(licenseNo)
);

CREATE TABLE Household(
    householdAddress    CHAR(100) UNIQUE NOT NULL,
    noCars              INTEGER NOT NULL,
    noDrivers           INTEGER NOT NULL,
    PRIMARY KEY (householdAddress)
);

CREATE TABLE Vehicle(
    licensePlate        CHAR(6) UNIQUE NOT NULL,
    make                CHAR(20) NOT NULL,
    model               CHAR(20) NOT NULL,
    modelYear           INTEGER NOT NULL,
    PRIMARY KEY (licensePlate)
);

CREATE TABLE Driver_HiredBy(
    companyID           INTEGER NOT NULL,
    licenseNo           INTEGER UNIQUE NOT NULL,
    PRIMARY KEY (licenseNo, companyID),
    FOREIGN KEY (companyID) REFERENCES Company(companyID),
    FOREIGN KEY (licenseNo) REFERENCES License(licenseNo)
);

CREATE TABLE Vehicle_OwnedByDriver(
    licenseNo           INTEGER UNIQUE NOT NULL,
    licensePlate        CHAR(6) UNIQUE NOT NULL,
    PRIMARY KEY (licenseNo, licensePlate),
    FOREIGN KEY (licenseNo) REFERENCES License(licenseNo),
    FOREIGN KEY (licensePlate) REFERENCES Vehicle(licensePlate)
);

CREATE TABLE Vehicle_OwnedByCompany(
    companyID           INTEGER NOT NULL,
    licensePlate        CHAR(6) UNIQUE NOT NULL,
    PRIMARY KEY (companyID, licensePlate),
    FOREIGN KEY (companyID) REFERENCES Company(companyID),
    FOREIGN KEY (licensePlate) REFERENCES Vehicle(licensePlate)
);

CREATE TABLE BelongTo(
    householdAddress    CHAR(100),
    licenseNo           INTEGER,
    PRIMARY KEY (householdAddress, licenseNo),
    FOREIGN KEY (householdAddress) REFERENCES Household(householdAddress),
    FOREIGN KEY (licenseNo) REFERENCES License(licenseNo)
);

CREATE TABLE HeldBy(
    licenseNo           INTEGER UNIQUE NOT NULL, 
    driverName          CHAR(20) NOT NULL,
    PRIMARY KEY (licenseNo),
    FOREIGN KEY (licenseNo) REFERENCES License(licenseNo)
);

CREATE TABLE CoveredBy(
    policyNo            INTEGER NOT NULL,
    licensePlate        CHAR(6) NOT NULL,
    PRIMARY KEY (policyNo),
    FOREIGN KEY (policyNo) REFERENCES Insurance(policyNo),
    FOREIGN KEY (licensePlate) REFERENCES Vehicle(licensePlate)
);

CREATE TABLE InvolvedIn(
    eventNo             INTEGER,
    licensePlate        CHAR(6) NOT NULL,
    atFault             INTEGER NOT NULL,
    PRIMARY KEY (eventNo, licensePlate),
    FOREIGN KEY (eventNo) REFERENCES Incident(eventNo),
    FOREIGN KEY (licensePlate) REFERENCES Vehicle(licensePlate)
);

CREATE TABLE Incurs(
    eventNo             INTEGER NOT NULL,
    invoiceNo           INTEGER NOT NULL,
    PRIMARY KEY (eventNo, invoiceNo),
    FOREIGN KEY (eventNo) REFERENCES Incident(eventNo),
    FOREIGN KEY (invoiceNo) REFERENCES Bill(invoiceNo)
);

CREATE TABLE PaysFor(
    invoiceNo           INTEGER NOT NULL,
    policyNo            INTEGER NOT NULL,
    PRIMARY KEY (invoiceNo, policyNo),
    FOREIGN KEY (invoiceNo) REFERENCES Bill(invoiceNo),
    FOREIGN KEY (policyNo) REFERENCES Insurance(policyNo)
);



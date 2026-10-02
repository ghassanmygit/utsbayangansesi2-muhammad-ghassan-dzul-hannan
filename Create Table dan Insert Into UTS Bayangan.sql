
-- DATA DEFINITION LANGUAGE --


-- Buat Table Untuk DreamHome

CREATE TABLE Branch (
    branchNo VARCHAR(10) PRIMARY KEY,
    street VARCHAR(50),
    city VARCHAR(50),
    postcode VARCHAR(20)
);

CREATE TABLE PrivateOwner (
    ownerNo VARCHAR(10) PRIMARY KEY,
    fName VARCHAR(50),
    lName VARCHAR(50),
    address VARCHAR(100),
    telNo VARCHAR(20)
);

CREATE TABLE Client (
    clientNo VARCHAR(10) PRIMARY KEY,
    fName VARCHAR(50),
    lName VARCHAR(50),
    telNo VARCHAR(20),
    prefType VARCHAR(20),
    maxRent DECIMAL(10, 2)
);

CREATE TABLE Staff (
    staffNo VARCHAR(10) PRIMARY KEY,
    fName VARCHAR(50),
    lName VARCHAR(50),
    position VARCHAR(50),
    sex CHAR(1),
    DOB DATE,
    salary DECIMAL(10, 2),
    branchNo VARCHAR(10),
    FOREIGN KEY (branchNo) REFERENCES Branch(branchNo)
);

CREATE TABLE PropertyForRent (
    propertyNo VARCHAR(10) PRIMARY KEY,
    street VARCHAR(50),
    city VARCHAR(50),
    postcode VARCHAR(20),
    type VARCHAR(20),
    rooms INT,
    rent DECIMAL(10, 2),
    ownerNo VARCHAR(10),
    staffNo VARCHAR(10),
    branchNo VARCHAR(10),
    FOREIGN KEY (ownerNo) REFERENCES PrivateOwner(ownerNo),
    FOREIGN KEY (staffNo) REFERENCES Staff(staffNo),
    FOREIGN KEY (branchNo) REFERENCES Branch(branchNo)
);

CREATE TABLE Viewing (
    clientNo VARCHAR(10),
    propertyNo VARCHAR(10),
    viewDate DATE,
    comment VARCHAR(100),
    PRIMARY KEY (clientNo, propertyNo, viewDate),
    FOREIGN KEY (clientNo) REFERENCES Client(clientNo),
    FOREIGN KEY (propertyNo) REFERENCES PropertyForRent(propertyNo)
);

CREATE TABLE Registration (
    clientNo VARCHAR(10),
    branchNo VARCHAR(10),
    staffNo VARCHAR(10),
    dateJoined DATE,
    PRIMARY KEY (clientNo, branchNo),
    FOREIGN KEY (clientNo) REFERENCES Client(clientNo),
    FOREIGN KEY (branchNo) REFERENCES Branch(branchNo),
    FOREIGN KEY (staffNo) REFERENCES Staff(staffNo)
);

-- Masukkan Data Setiap Tabel

INSERT INTO Branch (branchNo, street, city, postcode) VALUES
('B005', '22 Deer Rd', 'London', 'SW1 4EH'),
('B007', '16 Argyll St', 'Aberdeen', 'AB2 3SU'),
('B003', '16 Main St', 'Glasgow', 'G11 9QX'),
('B004', '32 Manse Rd', 'Bristol', 'BS9 1NZ'),
('B002', '56 Cloves Dr', 'London', 'NW10 6EU');

INSERT INTO PrivateOwner (ownerNo, fName, lName, address, telNo) VALUES
('CO46', 'Joe', 'Keogh', '2 Fergus Dr, Aberdeen AB2 7SX', '01224-861212'),
('CO87', 'Carol', 'Farrel', '6 Achray St, Glasgow G32 9DX', '0141-357-7419'),
('CO40', 'Tina', 'Murphy', '63 Well St, Glasgow G42', '0141-943-1728'),
('CO93', 'Tony', 'Shaw', '12 Park Pl, Glasgow G4 0QR', '0141-225-7025');

INSERT INTO Client (clientNo, fName, lName, telNo, prefType, maxRent) VALUES
('CR76', 'John', 'Kay', '0207-774-5632', 'Flat', 425.00),
('CR56', 'Aline', 'Stewart', '0141-848-1825', 'Flat', 350.00),
('CR74', 'Mike', 'Ritchie', '01475-392178', 'House', 750.00),
('CR62', 'Mary', 'Tregear', '01224-196720', 'Flat', 600.00);

INSERT INTO Staff (staffNo, fName, lName, position, sex, DOB, salary, branchNo) VALUES
('SL21', 'John', 'White', 'Manager', 'M', '1945-10-01', 30000.00, 'B005'),
('SG37', 'Ann', 'Beech', 'Assistant', 'F', '1960-11-10', 12000.00, 'B003'),
('SG14', 'David', 'Ford', 'Supervisor', 'M', '1958-03-24', 18000.00, 'B003'),
('SA9', 'Mary', 'Howe', 'Assistant', 'F', '1970-02-19', 9000.00, 'B007'),
('SG5', 'Susan', 'Brand', 'Manager', 'F', '1940-06-03', 24000.00, 'B003'),
('SL41', 'Julie', 'Lee', 'Assistant', 'F', '1965-06-13', 9000.00, 'B005');

INSERT INTO PropertyForRent (propertyNo, street, city, postcode, type, rooms, rent, ownerNo, staffNo, branchNo) VALUES
('PA14', '16 Holhead', 'Aberdeen', 'AB7 5SU', 'House', 6, 650.00, 'CO46', 'SA9', 'B007'),
('PL94', '6 Argyll St', 'London', 'NW2', 'Flat', 4, 400.00, 'CO87', 'SL41', 'B005'),
('PG4', '6 Lawrence St', 'Glasgow', 'G11 9QX', 'Flat', 3, 350.00, 'CO40', NULL, 'B003'),
('PG36', '2 Manor Rd', 'Glasgow', 'G32 4QX', 'Flat', 3, 375.00, 'CO93', 'SG37', 'B003'),
('PG21', '18 Dale Rd', 'Glasgow', 'G12', 'House', 5, 600.00, 'CO87', 'SG14', 'B003'),
('PG16', '5 Novar Dr', 'Glasgow', 'G12 9AX', 'Flat', 4, 450.00, 'CO93', 'SG14', 'B003');

INSERT INTO Viewing (clientNo, propertyNo, viewDate, comment) VALUES
('CR56', 'PA14', '2004-05-24', 'too small'),
('CR76', 'PG4', '2004-04-20', 'too remote'),
('CR56', 'PG4', '2004-05-26', NULL),
('CR62', 'PA14', '2004-05-14', 'no dining room'),
('CR56', 'PG36', '2004-04-28', NULL);

INSERT INTO Registration (clientNo, branchNo, staffNo, dateJoined) VALUES
('CR76', 'B005', 'SL41', '2004-01-02'),
('CR56', 'B003', 'SG37', '2003-04-11'),
('CR74', 'B003', 'SG37', '2002-11-16'),
('CR62', 'B007', 'SA9', '2003-03-07');
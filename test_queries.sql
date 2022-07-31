SELECT l.licenseNo, l.licenceClass, co.ownerName, co.age, bt.householdAddress 
    FROM License l, CarOwner co, belongTo bt 
    WHERE l.licenseNo = 9000001 
        AND l.licenseNo = co.licenseNo 
        AND l.licenseNo = bt.licenseNo

SELECT v.licensePlate, v.make, v.model, v.modelYear, l.licenseNo, co.ownerName, co.age, bt.householdAddress
    FROM Vehicle v, Vehicle_OwnedByDriver obd, License l, CarOwner co, belongTo bt
    WHERE v.licensePlate = 'PS002L'
        AND v.licensePlate = obd.licensePlate
        AND obd.licenseNo = l.licenseNo
        AND l.licenseNo = co.licenseNo 
        AND l.licenseNo = bt.licenseNo

INSERT INTO Vehicle VALUES ('PT000A', 'Mazda', 'RX8', 2009);
INSERT INTO Vehicle_OwnedByDriver VALUES (9000001, 'PT000A');

DROP TABLE Vehicle_OwnedByDriver;
DROP TABLE Vehicle;
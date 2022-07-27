INSERT INTO Company VALUES(100001, 'Bob\'s Mowing', 5, 5, '18960 72 Ave. Surrey, BC');
INSERT INTO Company VALUES(100002, 'IKEA', 10, 10, '1000 Lougheed Hwy. Coquitlam, BC');
INSERT INTO Company VALUES(100003, 'Super Appliances', 5, 10, '13651 Bridgeport Rd. Richmond, BC');
INSERT INTO Company VALUES(100004, 'Zoom Parking Management', 100, 500, '601 W Cordova St. Vancouver, BC');
INSERT INTO Company VALUES(100005, 'Autocraft Auto Parts', 2, 3, '5459 Kingsway Burnaby, BC');

INSERT INTO Incident VALUES(001, 2, '2021-12-03 09:32:23', 'EB Brunette Ave. @ Hwy. 1 Offramp');
INSERT INTO Incident VALUES(002, 5, '2022-04-20 21:32:17', 'SB Hwy. 99 @ George Massey Tunnel');
INSERT INTO Incident VALUES(003, 1, '2021-06-09 06:09:00', 'NB 154 St. @ 86 Ave.');
INSERT INTO Incident VALUES(004, 2, '2022-05-23 15:43:37', 'WB Alderbridge Way @ No. 3 Rd.');
INSERT INTO Incident VALUES(005, 2, '2022-07-01 23:57:55', 'NB Seymour St. @ W Georgia St.');

INSERT INTO Bill VALUES(001, 2500, 'Rear Hatch Door, Rear Bumper, Rear Left Taillight Assembly');
INSERT INTO Bill VALUES(002, 10200, 'Front Bumper, Hood, Front Windshield, Sensors');
INSERT INTO Bill VALUES(003, 1200, 'Front Right Suspension Assembly');
INSERT INTO Bill VALUES(004, 400, 'Front Left Headlight Assembly');
INSERT INTO Bill VALUES(005, 2450, 'Rear Right Passenger Door, Rear Right Fender, Right Side Skirt');

INSERT INTO Insurance VALUES(1101, 175, 'Basic Coverage');
INSERT INTO Insurance VALUES(1201, 350, 'Comprehensive Coverage');
INSERT INTO Insurance VALUES(1301, 150, 'Basic Coverage');
INSERT INTO Insurance VALUES(1401, 1175, 'Commercial Coverage');
INSERT INTO Insurance VALUES(1501, 725, 'High Value Vehicle Coverage');

INSERT INTO License VALUES(9000001, 5, NULL);
INSERT INTO License VALUES(9000002, 7, 'Supervisor Required');
INSERT INTO License VALUES(9000003, 5, 'Prescription Glasses Required');
INSERT INTO License VALUES(9000004, 4, 'Daylight Hours Only');
INSERT INTO License VALUES(9000005, 2, NULL);

INSERT INTO CarOwner VALUES(9000001, 'Diego Buencamino', 22, 1);
INSERT INTO CarOwner VALUES(9000002, 'Ryan He', 23, 1);
INSERT INTO CarOwner VALUES(9000003, 'Shintaro Morikawa', 21, 1);
INSERT INTO CarOwner VALUES(9000004, 'Bob Mower', 56, 3);
INSERT INTO CarOwner VALUES(9000005, 'Kevin Nguyen', 24, 2);

INSERT INTO Household VALUES('185 Tidewater Way Lions Bay, BC', 6, 3);
INSERT INTO Household VALUES('3363 Silverthrone Dr. Coquitlam, BC', 3, 3);
INSERT INTO Household VALUES('8300 Sunnycroft Rd. Richmond, BC', 5, 3);
INSERT INTO Household VALUES('12674 22 Ave. Surrey, BC', 1, 1);
INSERT INTO Household VALUES('18960 72 Ave. Surrey, BC', 2, 2);

INSERT INTO Vehicle VALUES('PS002L', 'Mazda', 'Mazdaspeed3', 2009);
INSERT INTO Vehicle VALUES('HX395D', 'BMW', 'M550i xDrive', 2015);
INSERT INTO Vehicle VALUES('358WDS', 'Honda', 'Civic Sport', 2018);
INSERT INTO Vehicle VALUES('SD2847', 'Ford', 'F150 King Ranch', 2021);
INSERT INTO Vehicle VALUES('LS2122', 'Ford', 'F150 XL', 2015);
INSERT INTO Vehicle VALUES('LS2123', 'Ford', 'F150 XL', 2015);
INSERT INTO Vehicle VALUES('LS2124', 'Ford', 'F150 XL', 2015);
INSERT INTO Vehicle VALUES('LS2125', 'Ford', 'F150 XL', 2015);
INSERT INTO Vehicle VALUES('LS2126', 'Ford', 'F150 XL', 2015);
INSERT INTO Vehicle VALUES('LOLGAS', 'Tesla', 'Model S Plaid', 2023);

INSERT INTO Driver_HiredBy VALUES(100001, 9000001);
INSERT INTO Driver_HiredBy VALUES(100002, 9000002);
INSERT INTO Driver_HiredBy VALUES(100003, 9000003);
INSERT INTO Driver_HiredBy VALUES(100004, 9000004);
INSERT INTO Driver_HiredBy VALUES(100005, 9000005);

INSERT INTO Vehicle_OwnedByDriver VALUES(9000001, 'PS002L');
INSERT INTO Vehicle_OwnedByDriver VALUES(9000002, 'HX395D');
INSERT INTO Vehicle_OwnedByDriver VALUES(9000003, '358WDS');
INSERT INTO Vehicle_OwnedByDriver VALUES(9000004, 'SD2847');
INSERT INTO Vehicle_OwnedByDriver VALUES(9000005, 'LOLGAS');

INSERT INTO Vehicle_OwnedByCompany VALUES(100001, 'LS2122');
INSERT INTO Vehicle_OwnedByCompany VALUES(100001, 'LS2123');
INSERT INTO Vehicle_OwnedByCompany VALUES(100001, 'LS2124');
INSERT INTO Vehicle_OwnedByCompany VALUES(100001, 'LS2125');
INSERT INTO Vehicle_OwnedByCompany VALUES(100001, 'LS2126');

INSERT INTO BelongTo VALUES('185 Tidewater Way Lions Bay, BC', 9000001);
INSERT INTO BelongTo VALUES('3363 Silverthrone Dr. Coquitlam, BC', 9000002);
INSERT INTO BelongTo VALUES('8300 Sunnycroft Rd. Richmond, BC', 9000003);
INSERT INTO BelongTo VALUES('12674 22 Ave. Surrey, BC', 9000004);
INSERT INTO BelongTo VALUES('18960 72 Ave. Surrey, BC', 9000005);

# HeldBy skipped

INSERT INTO CoveredBy VALUES (1101, 'PS002L');
INSERT INTO CoveredBy VALUES (1201, 'HX395D');
INSERT INTO CoveredBy VALUES (1301, '358WDS');
INSERT INTO CoveredBy VALUES (1401, 'SD2847');
INSERT INTO CoveredBy VALUES (1501, 'LOLGAS');

INSERT INTO InvolvedIn VALUES (001, 'PS002L', 50);
INSERT INTO InvolvedIn VALUES (001, '358WDS', 50);
INSERT INTO InvolvedIn VALUES (003, 'SD2847', 100);
INSERT INTO InvolvedIn VALUES (004, 'LOLGAS', 60);
INSERT INTO InvolvedIn VALUES (005, 'HX395D', 40);

INSERT INTO Incurs VALUES (001, 001);
INSERT INTO Incurs VALUES (001, 002);
INSERT INTO Incurs VALUES (003, 003);
INSERT INTO Incurs VALUES (004, 004);
INSERT INTO Incurs VALUES (004, 005);

INSERT INTO PaysFor VALUES (001, 1101);
INSERT INTO PaysFor VALUES (002, 1201);
INSERT INTO PaysFor VALUES (003, 1301);
INSERT INTO PaysFor VALUES (004, 1401);
INSERT INTO PaysFor VALUES (005, 1501);
database:Oracle

CREATE TABLE HotelStays 
(roomNum INTEGER NOT NULL, 
arrDate DATE NOT NULL , 
depDate DATE NOT NULL, 
guestName CHAR(30) NOT NULL, 
constraint chk_arrDate check(arrDate<depdate), 
PRIMARY KEY (roomNum, arrDate))
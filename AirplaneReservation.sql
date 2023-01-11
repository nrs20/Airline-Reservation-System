

DROP TABLE PASSENGER CASCADE CONSTRAINTS;
DROP TABLE BAGGAGE CASCADE CONSTRAINTS;
DROP TABLE TICKET CASCADE CONSTRAINTS;
DROP TABLE FLIGHTS CASCADE CONSTRAINTS;

-- Flights Table -- 
CREATE TABLE FLIGHTS (
    Flight_number VARCHAR(30),	
    Airline VARCHAR(64) NOT NULL,
    Capacity INT NOT NULL,
    Origin_airport VARCHAR(64) NOT NULL,
    Destination_airport	VARCHAR(64) NOT NULL,
    Departure_time Timestamp NOT NULL,
    Arrival_Time Timestamp NOT NULL,
    Flight_duration CHAR(8) NOT NULL,
    PRIMARY KEY (Flight_number)
);

-- Passenger Table -- 
CREATE TABLE PASSENGER (
    Passenger_id VARCHAR(30),	
    Passenger_name VARCHAR(64) NOT NULL,
    Birthdate DATE NOT NULL,
    PRIMARY KEY (Passenger_id)
);

-- Ticket Table -- 
CREATE TABLE TICKET (
    Ticket_number VARCHAR(30),
    Seat_number VARCHAR(30) NOT NULL,	
    Fare_cost FLOAT NOT NULL,
    Passenger_id VARCHAR(30) NOT NULL,
    Flight_id VARCHAR(30) NOT NULL,	
    PRIMARY KEY (Ticket_number),
    FOREIGN KEY (Passenger_id) REFERENCES PASSENGER (Passenger_id)
    ON DELETE CASCADE,
    FOREIGN KEY (Flight_id) REFERENCES FLIGHTS (Flight_number)
    ON DELETE CASCADE
);

-- Baggage Table -- 
CREATE TABLE BAGGAGE (
    Bag_id VARCHAR(30),	
    Weight FLOAT NOT NULL,
    Color VARCHAR(30) NOT NULL,
    Passenger_id VARCHAR(30) NOT NULL,
    PRIMARY KEY (Bag_id),
    FOREIGN KEY (Passenger_id) REFERENCES PASSENGER (Passenger_id)
    ON DELETE CASCADE
);

-- Inserting into Flights -- 
INSERT INTO FLIGHTS(Flight_number, Airline, Capacity, Origin_airport, Destination_airport, Departure_Time, Arrival_Time, Flight_duration)
VALUES ('UA1104', 'United Airlines', '412', 'Newark Liberty International Airport', 'Luis Munoz Marin International Airport', TO_DATE('2022-12-20 09:00:00','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-12-20 13:20:00','YYYY-MM-DD HH24:MI:SS'), '04:20:00');

INSERT INTO FLIGHTS(Flight_number, Airline, Capacity, Origin_airport, Destination_airport, Departure_Time, Arrival_Time, Flight_duration)
VALUES ('JB2252', 'JetBlue', '200', 'Birmingham-Shuttlesworth International Airport', 'Cyril E. King Airport', TO_DATE('2022-11-16 07:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-11-16 10:40:00', 'YYYY-MM-DD HH24:MI:SS'), '03:40:00'); 

INSERT INTO FLIGHTS(Flight_number, Airline, Capacity, Origin_airport, Destination_airport, Departure_Time, Arrival_Time, Flight_duration)
VALUES ('AA7489', 'American Airlines', '300', 'Henry E. Rohlsen Airport', 'Pago Pago International Airport', TO_DATE('2023-04-05 06:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-04-06 18:15:00', 'YYYY-MM-DD HH24:MI:SS'), '35:45:00');

INSERT INTO FLIGHTS(Flight_number, Airline, Capacity, Origin_airport, Destination_airport, Departure_Time, Arrival_Time, Flight_duration) 
VALUES ('NK9384', 'Spirit Airlines', '250', 'Sheridan County Airport', 'Kahului Airport', TO_DATE('2023-08-08 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-09 22:35:00', 'YYYY-MM-DD HH24:MI:SS'), '14:35:00');

INSERT INTO FLIGHTS(Flight_number, Airline, Capacity, Origin_airport, Destination_airport, Departure_Time, Arrival_Time, Flight_duration) 
VALUES ('JK1257', 'Delta Airlines', '300', 'John Wayne Airport', 'Palm Beach International Airport',  TO_DATE('2023-07-14 05:00:00', 'YYYY-MM-DD HH24:MI:SS'),  TO_DATE('2023-07-14 16:30:00', 'YYYY-MM-DD HH24:MI:SS'), '11:30:00');

-- Inserting into Passenger --
INSERT INTO PASSENGER (Passenger_id, Passenger_name, Birthdate) 
VALUES ('L12345678901234', 'Dustin R La', TO_DATE('2001-12-07','yyyy-mm-dd'));

INSERT INTO PASSENGER (Passenger_id, Passenger_name, Birthdate) 
VALUES ('C37482746371623', 'Natalia R Smith', TO_DATE('2002-08-22','yyyy-mm-dd'));

INSERT INTO PASSENGER (Passenger_id, Passenger_name, Birthdate) 
VALUES ('B19873658071334', 'Jose M Cabrera', TO_DATE('2002-09-25','yyyy-mm-dd'));

INSERT INTO PASSENGER (Passenger_id, Passenger_name, Birthdate) 
VALUES ('D78123648271356', 'Rishi Sakunala', TO_DATE('2002-07-05','yyyy-mm-dd'));

INSERT INTO PASSENGER (Passenger_id, Passenger_name, Birthdate) 
VALUES ('H21978346981237', 'Gautham Nagrajan', TO_DATE('2002-03-12','yyyy-mm-dd'));

-- Inserting into Ticket --
INSERT INTO TICKET(Ticket_number, Seat_number, Fare_cost, Passenger_id, Flight_id)
VALUES('98372049857281', '34B' ,'238.21', 'L12345678901234', 'UA1104');

INSERT INTO TICKET(Ticket_number, Seat_number, Fare_cost, Passenger_id, Flight_id)
VALUES('45758362801283', '22A', '216.23', 'C37482746371623', 'JB2252');

INSERT INTO TICKET(Ticket_number, Seat_number, Fare_cost, Passenger_id, Flight_id)
VALUES('75845610293613', '46B', '522.43', 'B19873658071334', 'AA7489' );

INSERT INTO TICKET(Ticket_number, Seat_number, Fare_cost, Passenger_id, Flight_id)
VALUES('19238476193242', '67D', '310.21', 'D78123648271356', 'NK9384');

INSERT INTO TICKET(Ticket_number, Seat_number, Fare_cost, Passenger_id, Flight_id)
VALUES('21598724297644', '26G', '478.32', 'H21978346981237', 'JK1257');



-- Inserting into Baggage --
INSERT INTO BAGGAGE(Bag_id, Weight, Color, Passenger_id)
VALUES ('AHGIU56739', '27.23', 'Blue', 'L12345678901234'); 

INSERT INTO BAGGAGE(Bag_id, Weight, Color, Passenger_id)
VALUES ('DSGER78134', '25.72', 'Blue', 'C37482746371623');

INSERT INTO BAGGAGE(Bag_id, Weight, Color, Passenger_id)
VALUES ('UIOSE83754', '31.67', 'Green', 'B19873658071334');

INSERT INTO BAGGAGE(Bag_id, Weight, Color, Passenger_id)
VALUES ('NIMDT56129', '49.99', 'Red', 'D78123648271356');

INSERT INTO BAGGAGE(Bag_id, Weight, Color, Passenger_id)
VALUES ('ALPID64812', '20.82', 'Orange', 'H21978346981237');



SELECT *
FROM BAGGAGE;

SELECT * 
FROM FLIGHTS;

SELECT *
FROM PASSENGER;

SELECT *
FROM TICKET;

-- Update and Delete on Passenger --
UPDATE PASSENGER
SET Passenger_name = 'Hrishikesh Sakunala'
WHERE Passenger_id = 'D78123648271356';

DELETE 
FROM PASSENGER
WHERE Passenger_name = 'Gautham Nagrajan';

-- Update and Delete on Baggage --
UPDATE Baggage
SET Passenger_id = 'D78123648271356'
WHERE Bag_id = 'DSGER78134';

DELETE
FROM BAGGAGE
WHERE Bag_id = 'UIOSE83754';

-- Update and Delete on Ticket --
UPDATE TICKET
SET Flight_id = 'AA7489'
WHERE Ticket_number = '45758362801283';

DELETE
FROM TICKET
WHERE Ticket_number = '98372049857281';

-- Update and Delete on Flights --
UPDATE FLIGHTS 
SET Destination_airport = 'Kahului Airport'
WHERE Flight_number = 'JB2252';

 
DELETE 
FROM FLIGHTS 
WHERE Flight_Number = 'UA1104';

SELECT *
FROM BAGGAGE;

SELECT * 
FROM FLIGHTS;

SELECT *
FROM PASSENGER;

SELECT *
FROM TICKET;

--beginning new ones
--below is carlos
INSERT INTO FLIGHTS(Flight_number, Airline, Capacity, Origin_airport, Destination_airport, Departure_Time, Arrival_Time, Flight_duration)--carlos
VALUES ('JK3216', 'Delta Airlines', '350', 'John Wayne Airport', 'Palm Beach International Airport',  TO_DATE('2023-07-14 07:00:00', 'YYYY-MM-DD HH24:MI:SS'),  TO_DATE('2023-07-14 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), '05:30:00');

INSERT INTO FLIGHTS(Flight_number, Airline, Capacity, Origin_airport, Destination_airport, Departure_Time, Arrival_Time, Flight_duration)--derek
VALUES ('AA1257', 'American Airlines', '250' ,'Newark Liberty International Airport', 'Kahului Airport',  TO_DATE('2023-09-07 09:00:00', 'YYYY-MM-DD HH24:MI:SS'),  TO_DATE('2023-09-07 14:10:00', 'YYYY-MM-DD HH24:MI:SS'), '05:10:00');

INSERT INTO FLIGHTS(Flight_number, Airline, Capacity, Origin_airport, Destination_airport, Departure_Time, Arrival_Time, Flight_duration)--alex
VALUES ('JK5190', 'Delta Airlines', '340' ,'Pago Pago International Airport', 'Kahului Airport',  TO_DATE('2023-09-07 10:50:00', 'YYYY-MM-DD HH24:MI:SS'),  TO_DATE('2023-09-07 17:50:00', 'YYYY-MM-DD HH24:MI:SS'), '07:00:00');

--new inserts--
INSERT INTO PASSENGER (Passenger_id, Passenger_name, Birthdate) 
VALUES ('L10987654321023', 'Carlos Ulberg', TO_DATE('2003-11-02','yyyy-mm-dd'));

INSERT INTO PASSENGER (Passenger_id, Passenger_name, Birthdate) 
VALUES ('K87364120983728', 'Alex Pereira', TO_DATE('1982-1-05','yyyy-mm-dd'));

INSERT INTO PASSENGER (Passenger_id, Passenger_name, Birthdate) 
VALUES ('W92384019287364', 'Derek Brunson', TO_DATE('1928-3-28','yyyy-mm-dd'));

SELECT Flight_id, AVG(Fare_cost), Destination_airport
FROM TICKET, FLIGHTS
WHERE TICKET.Flight_id = FLIGHTS.Flight_number
GROUP BY Flight_id, Destination_Airport;

INSERT INTO TICKET(Ticket_number, Seat_number, Fare_cost, Passenger_id, Flight_id) --inserting carlos, flight ID goes back to flight_number.
VALUES ('34168724297312', '57A', '473.64', 'L10987654321023','JK3216');

INSERT INTO TICKET(Ticket_number, Seat_number, Fare_cost, Passenger_id, Flight_id) --inserting derek, flight ID goes back to flight_number.
VALUES ('29132720995412', '90D', '300.56', 'W92384019287364','AA1257');

INSERT INTO TICKET(Ticket_number, Seat_number, Fare_cost, Passenger_id, Flight_id) --inserting alex, flight ID goes back to flight_number.
VALUES ('71463910335113', '86B', '250.50', 'K87364120983728','JK5190');


--adding new inserts to improve this query--


--new baggage 
--inserting baggage info.--
INSERT INTO BAGGAGE(Bag_id, Weight, Color, Passenger_id)
VALUES ('DOEPS93201', '25.61', 'Purple', 'W92384019287364'); --derek

INSERT INTO BAGGAGE(Bag_id, Weight, Color, Passenger_id)
VALUES ('DWEPS93207', '10.32', 'Black', 'W92384019287364');--derek

INSERT INTO BAGGAGE(Bag_id, Weight, Color, Passenger_id)
VALUES ('ZOEPS34201', '15.91', 'Grey', 'W92384019287364');--derek

INSERT INTO BAGGAGE(Bag_id, Weight, Color, Passenger_id)
VALUES ('HJKSP92381', '20.12', 'Maroon', 'K87364120983728'); --alex

INSERT INTO BAGGAGE(Bag_id, Weight, Color, Passenger_id)
VALUES ('ZFKSP92382', '16.58', 'Green', 'K87364120983728');--alex

SELECT *
FROM BAGGAGE;

SELECT * 
FROM FLIGHTS;

SELECT *
FROM PASSENGER;

SELECT *
FROM TICKET;

SELECT Flight_id, AVG(Fare_cost), Destination_airport
FROM TICKET, FLIGHTS
WHERE TICKET.Flight_id = FLIGHTS.Flight_number
GROUP BY Flight_id, Destination_Airport;

SELECT PASSENGER.Passenger_name, BAGGAGE.Passenger_id, SUM(BAGGAGE.Weight)
FROM PASSENGER, BAGGAGE
WHERE PASSENGER.Passenger_id = BAGGAGE.Passenger_id
GROUP BY BAGGAGE.Passenger_id, PASSENGER.Passenger_name
HAVING COUNT(*) >=2;
   
SELECT TICKET.Passenger_id, PASSENGER.Passenger_name, TICKET.Fare_Cost
FROM TICKET, PASSENGER
WHERE TICKET.Passenger_id = Passenger.Passenger_id
AND TICKET.Fare_cost > ALL (
    SELECT TICKET.Fare_Cost
    FROM TICKET, FLIGHTS
    WHERE TICKET.Flight_id = FLIGHTS.Flight_number
    AND FLIGHTS.Destination_airport = 'Kahului Airport');

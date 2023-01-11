# Airline-Reservation-System
This is a fully functional SQL database that was created as a project with the goal of mirroring an Airline Reservation System. 

System Requirements:

Passengers are identified by a passenger ID and have a name, and birthdate. Passengers are able to book tickets for flights and have their own baggage. Passengers are able to book multiple tickets.

Tickets are identified by ticket number and have a seat number, fare cost, passenger ID and flight ID. All flights must have a ticket.

Baggage are identified by a bag ID and have weight, color, and passenger ID. A passenger can have zero, one, or multiple bags.

Flights are identified by flight number and have an airline, capacity, origin airport, destination airport, departure time, arrival time, and flight duration. Flights can have multiple tickets. Tickets are required to access flights. 

Queries explained:
1. GROUP BY Query:

Find the average fare cost of a given flight as well as the Airline. Select the Flight_id and airline and group all the tickets based on these attributes to find the average fare cost, and show the average price paid by the passengers of a given flight. 

SELECT TICKET.Flight_id, AVG(TICKET.Fare_cost), FLIGHTS.Airline
FROM TICKET, FLIGHTS
WHERE TICKET.Flight_id = FLIGHTS.Flight_number
GROUP BY TICKET.Flight_id, FLIGHTS.Airline;

2. GROUP BY and HAVING Query:

Find the total bag weight of a passenger if they have at least two bags. Select the Passenger_name from Passenger and the Passenger_id and Weight from Baggage. If a Passenger_id in Passenger and Baggage matches and the Passenger has at least two bags, return the total weight of the bags and group by the Passenger_id and Passenger_name. Display the total bag weight of each passenger if they have more than two bags.

SELECT PASSENGER.Passenger_name, BAGGAGE.Passenger_id, SUM(BAGGAGE.Weight)
FROM PASSENGER, BAGGAGE
WHERE PASSENGER.Passenger_id = BAGGAGE.Passenger_id
GROUP BY BAGGAGE.Passenger_id, PASSENGER.Passenger_name
HAVING COUNT(*) >=2;

3. ALL Query:

Find the Passenger_name and Passenger_id of the Passenger(s) who purchased a ticket that is greater than all the costs individually of the tickets with Destination_airport of “Kahului Airport”. Select the Passenger_id and Fare_cost from Ticket and Passenger_name from Passenger. Match the Passengers and Tickets based on Passenger_id. Then, use a nested query to find all the fare cost of the tickets with destination of “Kahului Airport”. Use this tuple to compare with all the tickets. The tickets that have a higher Fare_cost than all of the tuple’s values from the nested query are returned with their Passenger_name and Passenger_id.

SELECT TICKET.Passenger_id, PASSENGER.Passenger_name, TICKET.Fare_Cost, FLIGHTS.Destination_airport
FROM TICKET, PASSENGER, FLIGHTS
WHERE TICKET.Passenger_id = Passenger.Passenger_id
AND Fare_cost >= ALL (
    SELECT TICKET.Fare_Cost
    FROM TICKET, FLIGHTS
    WHERE TICKETS.Flight_id = FLIGHTS.Flight_number
    Destination_airport = 'Kahului Airport');	
    
4.IN Query:

Return the total baggage weight being carried by any airline with flights originating from Pago Pago International Airport, Henry E. Rohlsen Airport, and Birmingham-Shuttlesworth International Airport. The query can be used so that airlines can compare how much baggage, in terms of weight, they have moved in total from certain locations. Select the sum of the baggage weight and airline where the Passenger_id in Baggage and Passenger match along with the Passenger_id in Passenger and Ticket. Then match the Passenger with their Ticket using Passenger_id. Also match the Flight_id from Ticket with the Flight_number from Flights and find the airline from the nested query that finds the airlines who have Destination_airports of Pago Pago International Airport, Henry E. Rohlsen Airport, and/or Birmingham-Shuttlesworth International Airport. Finally, group the baggage weights by the Airline.

SELECT SUM(BAGGAGE.Weight), FLIGHTS.Airline
FROM TICKET, PASSENGER, BAGGAGE, FLIGHTS 
WHERE PASSENGER.Passenger_id = BAGGAGE.Passenger_id 
AND PASSENGER.Passenger_id = TICKET.Passenger_id
AND TICKET.Flight_id = FLIGHTS.Flight_number
AND FLIGHTS.Airline IN(
    SELECT Airline
    FROM FLIGHTS
    WHERE Origin_airport = 'Pago Pago International Airport'
    OR Origin_airport = 'Henry E. Rohlsen Airport'
    OR Origin_airport = 'Birmingham-Shuttlesworth International Airport'
)
GROUP BY FLIGHTS.Airline;


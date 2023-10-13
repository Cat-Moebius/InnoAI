-- Task 1.

SELECT a.aircraft_code, a.model, s.seat_no, s.fare_conditions
FROM aircrafts AS a
JOIN seats AS s ON a.aircraft_code = s.aircraft_code;

SELECT model AS name, 'самолет' AS object_type FROM aircrafts
UNION
SELECT airport_name, 'аэропорт' FROM airports;

-- Task 2.

SELECT model, "range"
FROM aircrafts AS a
WHERE "range" >= 5000
ORDER BY "range" DESC
LIMIT 10;

-- Task 3.

SELECT model, fare_conditions, COUNT(*) AS count_seats
FROM aircrafts AS a
JOIN seats AS s ON a.aircraft_code = s.aircraft_code
GROUP BY model, fare_conditions
ORDER BY model, count_seats;

-- Task 4.

SELECT passenger_name, t.ticket_no, departure_airport , arrival_airport , status , fare_conditions, actual_departure , actual_arrival , amount, total_amount
FROM flights AS f
JOIN ticket_flights AS tf ON f.flight_id = tf.flight_id
RIGHT JOIN tickets AS t ON tf.ticket_no = t.ticket_no
LEFT JOIN bookings AS b ON t.book_ref = b.book_ref;

-- Task 5.

CREATE OR REPLACE VIEW top10_aircrafts_model_by_range_view AS
    SELECT model, "range"
    FROM aircrafts AS a
    WHERE "range" >= 5000
    ORDER BY "range" DESC
    LIMIT 10;

select * from top10_aircrafts_model_by_range_view;
-- 1. List all customers who live in Texas (use JOINs)
--None of these have state, only city, post code, country, district

SELECT * FROM customer;
SELECT * from address;

SELECT *
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id


-- 2. Get all payments above $6.99 with the Customer's Full Name
--Peter Menard

SELECT * from payment;
SELECT * from customer;


SELECT first_name, last_name
FROM customer
WHERE customer_id IN(
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 6.99
    ORDER BY SUM(amount)
);


-- 3. Show all customers names who have made payments over $175(use subqueries)
--Peter Menard
SELECT * from payment;
SELECT * from customer;

SELECT first_name, last_name
FROM customer
WHERE customer_id IN(
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 175.00
    ORDER BY SUM(amount)
);


-- 4. List all customers that live in Nepal (use the city table)
--No data

SELECT * from city;

    SELECT city, first_name, last_name
    FROM address
    INNER JOIN city
    ON address.city_id = city.city_id
    INNER JOIN customer
    ON address.address_id = customer.address_id
    WHERE city = 'Nepal'


-- 5. Which staff member had the most transactions?
-- Mike Hillyer

SELECT * from rental;
SELECT * from staff;


SELECT first_name, last_name, staff_id
FROM staff
WHERE staff_id IN(
    SELECT count(staff_id)
    FROM rental
    GROUP BY staff_id
);


-- 6. How many movies of each rating are there?
-- NC-17 = 209
-- G = 178
-- PG-13 = 223
-- PG = 194
-- R = 196


SELECT * FROM film;

SELECT rating, count(rating)
FROM film
GROUP BY rating


-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
--Peter Menard

SELECT * from customer;

SELECT first_name, last_name
FROM customer
WHERE customer_id IN(
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 6.99
    ORDER BY SUM(amount)
);
--1. List all customers who live in Texas 
SELECT customer.first_name,	customer.last_name
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
FULL JOIN city
ON address.city_id = city.city_id
WHERE district = 'Texas'


select * from customer
 
--2. Get all payment above $6.99 with the Customer's full Name
SELECT customer.first_name, customer.last_name
FROM customer 
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id, payment.amount 
	HAVING amount > 6.99
	ORDER BY amount desc
);

--3. Show all customers who have made payments over $175(subqueries)
SELECT *
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
);

--4. List all customers that live in Nepal (use the city tble)
SELECT customer.first_name,customer.last_name,customer.email,country
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
FULL JOIN city
ON address.city_id = city.city_id
FULL JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal';

--5. Which staff member had the most transactions?
SELECT staff_id, count(amount)
FROM payment
GROUP BY staff_id
ORDER BY count(amount) DESC

--6. How many movies of each rating are there?  
SELECT rating, count(film_id)
FROM film
GROUP BY rating 
ORDER BY rating

--7. Show all customers who have made a single payment above $6.99 (Use Subqueries) 
SELECT *
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id, payment.amount 
	HAVING payment.amount > 6.99
);

--8. How many free rentals did our stores give away? 
SELECT count(amount)
FROM payment
WHERE amount = 0
GROUP by rental_id 
ORDER BY count(amount)

-- 1. List all customers who live in Texas (use JOINs)
SELECT customer_id
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas';

-- 2. Get all payments above $6.99 with the Customer's Full Name
SELECT payment.customer_id, first_name, last_name, amount
FROM payment
LEFT JOIN customer
ON payment.customer_id = customer.customer_id
WHERE amount > 6.99;

-- 3. Show all customers names who have made payments over $175 (use subqueries)
SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING sum(amount) > 175
);

-- 4. List all customers that live in Nepal (use the city table)
SELECT customer_id, country
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id
INNER JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal';

-- 5. Which staff member had the most transactions?
SELECT first_name, last_name, count(payment.staff_id)
FROM payment
LEFT JOIN staff
ON payment.staff_id = staff.staff_id
GROUP BY payment.staff_id, staff.first_name, staff.last_name
HAVING count(payment.staff_id) = (
    SELECT max(transaction_count) FROM (
        SELECT staff_id, count(staff_id) AS transaction_count 
		FROM payment
		GROUP BY staff_id
    ) AS count_of_transactions
);

-- 6. How many movies of each rating are there?
SELECT rating, count(rating)
FROM inventory
LEFT JOIN film
ON inventory.film_id = film.film_id
GROUP BY rating;

-- 7. Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT DISTINCT customer.customer_id
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE customer.customer_id IN (
	SELECT customer_id
	FROM payment
	WHERE amount > 6.99
);

-- 8. How many free rentals did our stores give away?

-- NOTE: SQL code below counts how many payments are $0 (free rental) by store but nothing 
-- is returned since the lowest payment amount is $2
SELECT staff.store_id, count(amount)
FROM payment
INNER JOIN staff
ON payment.staff_id = staff.staff_id
INNER JOIN store
ON staff.store_id = store.store_id
WHERE amount = 0
GROUP BY staff.store_id;

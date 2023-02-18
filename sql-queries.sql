-- 1. How many actors are there with the last name ‘Wahlberg’?
SELECT last_name, count(last_name)
FROM actor
WHERE last_name = 'Wahlberg'
GROUP BY last_name;

-- 2. How many payments were made between $3.99 and $5.99?
SELECT count(amount)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;

-- 3. What film does the store have the most of? (search in inventory)
SELECT film_id, count(film_id)
FROM inventory
GROUP BY film_id
HAVING count(film_id) = 
	(SELECT max(film_count) FROM 
		(SELECT film_id, count(film_id) AS film_count
		FROM inventory
		GROUP BY film_id) AS count_by_film)
ORDER BY film_id;

-- 4. How many customers have the last name ‘William’?
SELECT count(last_name)
FROM customer
WHERE last_name LIKE 'William'
GROUP BY last_name;

-- 5. What store employee (get the id) sold the most rentals?
SELECT staff_id
FROM rental
GROUP BY staff_id
ORDER BY count(staff_id) DESC LIMIT 1;

-- 6. How many different district names are there?
SELECT count(DISTINCT district)
FROM address;

-- 7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT film_id
FROM film_actor
GROUP BY film_id
ORDER BY count(actor_id) DESC LIMIT 1;

-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT count(last_name)
FROM customer
WHERE store_id = 1 AND last_name LIKE '%es';

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)
SELECT count(amounts_by_count)
FROM (SELECT amount, count(amount)
	FROM payment
    WHERE customer_id BETWEEN 380 and 430
	GROUP BY amount
	HAVING count(amount) > 250) AS amounts_by_count;

-- 10. Within the film table, how many rating categories are there? And what rating has the most
-- movies total?
SELECT count(DISTINCT rating)
from film;

-- Returns rating with the most movies and the number of movies
SELECT DISTINCT rating, count(rating)
FROM film
GROUP BY rating
HAVING count(rating)  =
		(SELECT max(rating_count) FROM 
		(SELECT DISTINCT rating, count(rating) AS rating_count
		FROM film
		GROUP BY rating) AS count_by_rating)
ORDER BY count(rating) DESC;
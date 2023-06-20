#Subqueries

USE sakila;

SELECT first_name
FROM actor
WHERE first_name = 1;

SELECT first_name
FROM actor
WHERE actor_id in (SELECT actor_id
				   FROM film_actor
                   WHERE film_id in (SELECT film_id
                                     FROM film_category
                                     WHERE category_id = (SELECT category_id
                                                          FROM category
                                                          WHERE name = 'Action')));


                    

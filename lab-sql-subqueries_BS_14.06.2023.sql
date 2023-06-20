#LAB | SQL Subqueries

USE sakila;

#Challenge

#Write SQL queries to perform the following tasks using the Sakila database:

#1.Determine the number of copies of the film "Hunchback Impossible" that exist in the inventory system.
SELECT COUNT(inventory.inventory_id)
FROM inventory
WHERE film_id in (SELECT film_id
		          FROM film
                  WHERE title = 'Hunchback Impossible');
#2.List all films whose length is longer than the average length of all the films in the Sakila database.
SELECT film.title, length
FROM film 
WHERE length > (SELECT AVG(length) 
				FROM film);
#3.Use a subquery to display all actors who appear in the film "Alone Trip".
SELECT actor.first_name, actor.last_name
FROM actor
WHERE actor.actor_id in (SELECT film_actor.actor_id
                         FROM film_actor
						 WHERE film_actor.film_id in (SELECT film.film_id
                                                      FROM film 
                                                      WHERE film.title = "Alone Trip"));
                                                      
#4.Sales have been lagging among young families, and you want to target family movies for a promotion. 
#Identify all movies categorized as family films.
SELECT film.title
FROM film
WHERE film_id in (SELECT film_id
				 FROM film_category
			     WHERE category_id in (SELECT category_id
								       FROM category
									   WHERE name = 'family'));
                                       
 
#5.Retrieve the name and email of customers from Canada using both subqueries and joins. 
#To use joins, you will need to identify the relevant tables and their primary and foreign keys.
SELECT first_name, last_name, email
FROM customer
WHERE address_id in (SELECT address_id 
				     FROM address
				     WHERE city_id in (SELECT city_id
									   FROM city
									   WHERE country_id in (SELECT country_id
															FROM country
															WHERE country = 'Canada')));

#6.Determine which films were starred by the most prolific actor in the Sakila database. 
#A prolific actor is defined as the actor who has acted in the most number of films. 
#First, you will need to find the most prolific actor and then use that actor_id to find the different films that he or she starred in.


#7.Find the films rented by the most profitable customer in the Sakila database. 
#You can use the customer and payment tables to find the most profitable customer, i.e., the customer who has made the largest sum of payments.


#8.Retrieve the client_id and the total_amount_spent of those clients who spent more than the average of the total_amount spent by each client. 
#You can use subqueries to accomplish this.
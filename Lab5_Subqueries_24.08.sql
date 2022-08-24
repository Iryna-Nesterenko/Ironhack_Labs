use sakila;
select * from film;
select * from inventory;

#1.How many copies of the film Hunchback Impossible exist in the inventory system?

select count(film_id )
from inventory
where film_id =       (
select film_id from film
where title = "Hunchback Impossible") 
group by film_id

#2. List all films whose length is longer than the average of all the films.
select * from film;

select avg(length) from film;

select title from film
where length > (select avg(length) from film)
group by title ;

#3. Use subqueries to display all actors who appear in the film Alone Trip.
select * from film;
select * from film_actor;
select * from actor;

select first_name, last_name 
from actor
join film_actor using(actor_id)
where film_id = (
select film_id from film
where title = "Alone Trip");

#4. Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films.
select * from film;
select * from film_category;
select * from category;

select title from film
where film_id in (
select film_id from film_category
where category_id = 
(select category_id from category
where `name` = "Family"));

select title 
from film
join film_category using (film_id)
where category_id = 
(select category_id from category
where `name` = "Family");

#5. Get name and email from customers from Canada using subqueries. Do the same with joins. Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, that will help you get the relevant information.
select * from customer;
select * from country;
select * from city;
select * from address;

select first_name, last_name, email from customer
where address_id in (
select address_id from address
where city_id in (
select city_id from city
where country_id = (
select country_id from country
where country = "Canada")))

#6. Which are films starred by the most prolific actor? Most prolific actor is defined as the actor that has acted in the most number of films. First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.
select * from film;
select * from film_actor;


select title from film 
where film_id in (
select film_id from film_actor
where actor_id = (
select actor_id from film_actor
group by actor_id
order by count(actor_id) desc
limit 1));

#7.Films rented by most profitable customer. You can use the customer table and payment table to find the most profitable customer ie the customer that has made the largest sum of payments

select * from customer;
select * from payment;


select first_name, last_name 
from customer
where customer_id in (
select customer_id from payment
where customer_id = 
(select customer_id
from payment
group by customer_id
order by sum(amount) desc));


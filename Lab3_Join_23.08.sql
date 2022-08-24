use sakila;
select * from actor;
select * from film_actor;

#1.Which actor has appeared in the most films?
select first_name, last_name, count(film_id)
from actor 
join film_actor using (actor_id)
group by actor_id
order by count(film_id) desc
limit 1;

#2.Most active customer (the customer that has rented the most number of films)
select * from customer;
select * from payment;
select first_name, last_name, count(payment_id)
from customer
join payment using(customer_id)
group by customer_id
order by count(payment_id) desc
limit 1;

#3.List number of films per category.
select * from film_category;
select * from category;
select name, count(category_id)
from category
join film_category using (category_id)
group by category_id;


#4.Display the first and last names, as well as the address, of each staff member.
select * from staff;
select * from address;
select first_name, last_name, address
from staff
join address using (address_id);

#5.Display the total amount rung up by each staff member in August of 2005.
select * from staff;
select * from payment;
select first_name, last_name, sum(amount)
from staff
join payment using (staff_id)
where payment_date between "2005-08-01" and "2005-08-31"
group by staff_id
order by sum(amount) desc;

#6.List each film and the number of actors who are listed for that film.
select * from film;
select * from film_actor;
select title, count(actor_id)
from film
join film_actor using (film_id)
group by film_id
order by count(actor_id) desc
limit 10;

#7.Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
select * from payment;
select * from customer;
select first_name, last_name, sum(amount)
from payment
join customer using (customer_id)
group by customer_id
order by last_name asc
limit 10;


#Optional: Which is the most rented film? The answer is Bucket Brotherhood This query might require using more than one join statement. Give it a try.
select * from rental;
select * from inventory;
select * from film;


select title, count(rental_id)
from film 
join inventory using (film_id)
join rental using (inventory_id)
group by title
order by count(rental_id) desc
limit 1;









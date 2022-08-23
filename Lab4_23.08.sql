use sakila;
#1.Write a query to display for each store its store ID, city, and country.
select * from store;
select * from city;
select * from country;
select * from address;

select store_id, city, country
from store
join address using (address_id)
join city using (city_id)
join country using (country_id);

#2.Write a query to display how much business, in dollars, each store brought in.
select * from store;
select * from payment;
select * from rental;
select * from inventory;


select store_id, sum(amount)
from store
join inventory using (store_id)
join rental using (inventory_id)
join payment using (rental_id)
group by store_id;

select store_id, sum(amount)
from store
join staff using (store_id)
join payment using (staff_id)
group by store_id;

select store_id, sum(amount)
from store
join customer using (store_id)
join payment using (customer_id)
group by store_id;




#3.What is the average running time(length) of films by category?
select * from category;
select * from film;
select * from film_category;

select `name`, avg(length)
from category
join film_category using (category_id)
join film using (film_id)
group by `name`;

#4.Which film categories are longest(length) (find Top 5)? (Hint: You can rely on question 3 output.)
select `name`, avg(length)
from category
join film_category using (category_id)
join film using (film_id)
group by `name`
order by avg(length) desc
limit 5;

#5.Display the top 5 most frequently(number of times) rented movies in descending order.
select title
from film 
join inventory using (film_id)
join rental using (inventory_id)
group by title
order by count(rental_id) desc
limit 5;

#6. List the top five genres in gross revenue in descending order.
select `name`, sum(amount)
from category
join film_category using (category_id)
join film using (film_id)
join inventory using (film_id)
join rental using (inventory_id)
join payment using (rental_id)
group by `name`
order by sum(amount) desc
limit 5;

#7.Is "Academy Dinosaur" available for rent from Store 1?

select * from store;
select * from rental;
select * from film;
select * from payment;
select * from customer;


select  "Academy Dinosaur", count("Academy Dinosaur")
from film
join inventory using (film_id)
join rental using (inventory_id)
join store using (store_id)
where store_id = 1 and return_date 
group by "Academy Dinosaur"





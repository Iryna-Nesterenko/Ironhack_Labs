
use sakila;
select * from film;

#Select one column from a table. Get film titles:
select title from film;

#select one column from a table and alias it. Get unique list of film languages under the alias language:
select language_id AS language FROM film;

# Find out how many stores does the company have?
select count(*) from store; 

#Find out how many employees staff does the company have?
select count(*) from staff;

#Return a list of employee first names only?
select first_name from staff;

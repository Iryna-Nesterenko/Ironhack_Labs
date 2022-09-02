use sakila;
INSERT INTO `sakila`.`actor`
(`actor_id`,
`first_name`,
`last_name`,
`last_update`)
VALUES
(<{actor_id: }>,
<{first_name: }>,
<{last_name: }>,
<{last_update: CURRENT_TIMESTAMP}>);

####### Insert statement
INSERT INTO `sakila`.`actor`
(`actor_id`,
`first_name`,
`last_name`)
VALUES
(12345,
"Moritz",
"jost");

select * from actor
where actor_id = 12345;

###### Update statement

UPDATE `sakila`.`actor`
SET
`first_name` = "Rodrigo"
WHERE `actor_id` =12345;

####### Delete statement

DELETE FROM `sakila`.`actor`
WHERE `actor_id` =12345;


###### DML_ Statement

create table  `test`(
`test_id` int not null auto_increment,
`f_name`varchar(45) not null,
`description`varchar(45) default null,
primary key (`test_id`)
);

###### Updating table
alter table `test`
add l_name varchar(45) not null;

##### Dropping table
drop table test


select film_id from film

#### views in sql
create view test_vies AS
select first_name from actor
join film_actor using (actor_id)
where film_id in (1,2,3,4,5,6,7,8,9,10)

select * from test_vies;
















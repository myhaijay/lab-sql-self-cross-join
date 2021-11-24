-- 1. Get all pairs of actors that worked together.
select * from 
(select first_name, last_name, film_id from actor
join film_actor using(actor_id)) as F
join 
(select first_name, last_name, film_id from actor
join film_actor using(actor_id)) as S
on F.film_id = S.film_id
order by F.film_id;



-- 2. Get all pairs of customers that have rented the same film more than 3 times.
select r.customer_id as Customers, r1.customer_id as Other_Customers, count(r1.rental_id) as Rental_Count from rental r
join rental as r1
on r.customer_id < r1.customer_id
and r.inventory_id = r1.inventory_id
group by r.customer_id, r1.customer_id
having count(r1.rental_id) > 3;

-- 3. Get all possible pairs of actors and films.

select fa1.actor_id as Actor_1, fa1.film_id as Film_1, fa2.actor_id as Actor_2, 
fa2.film_id as Film_2 from film_actor as fa1
join film_actor as fa2
on fa1.actor_id > fa2.actor_id
and fa1.film_id > fa2.film_id;

select * from film;


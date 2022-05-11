


--1. How many actors are there with the last name ‘Wahlberg’?

select count(last_name)
from actor
where last_name = 'Wahlberg'

--There are 2 Wahlberg last names in the actors list.


-----------------------------------------------------
--2. How many payments were made between $3.99 and $5.99?

select count(amount)
from payment
where amount between 3.99 and 5.99

--There were 5,561 payments between 3.99 and 5.99


-----------------------------------------------------

--3. What film does the store have the most of? (search in inventory)
--NOTE: Per Alex, we are to disregard the store ID, so the answer is in regards to both stores combined, not necessarily both stores.

select film.title
from inventory
join film
on inventory.film_id = film.film_id
group by inventory.film_id, film.title
order by max(inventory.film_id) desc 

--These stores have 1000 copies of Zorro Ark, more than any other 


-----------------------------------------------------
--4. How many customers have the last name ‘William’?

select count(last_name)
from customer
where last_name = 'William'

--There are 0 customers with the last name of 'William'


------------------------------------------------------------
--5. What store employee (get the id) sold the most rentals?

select staff_id, count(staff_id) 
from rental
group by staff_id

-- Employee 1 had more rentals, by 36. They rented 8,040, compared to 8,004 from employee 2.


--------------------------------------------------
--6. How many different district names are there?

select count(district) 
from address

--There are 603 districts


--------------------------------------------------------------------------------
--7. What film has the most actors in it? (use film_actor table and get film_id)

select film_id, max(film_id)
from film_actor
group by film_id 
order by max(film_id) desc

--Actor # 200 appears in 200 films.


------------------------------------------------------------------------------------------------
--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)

select count(last_name)
from customer
where last_name like '%es'

--There are 21 customers with last names ending 'es'


-------------------------------------------------------------------------------------------------
--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
--with ids between 380 and 430? (use group by and having > 250)

select customer_id ,amount, count(amount)
from payment
where customer_id between 380 and 430 
group by customer_id , amount 
having count(amount) > 250

--There are 0 amounts that were rented by customer_ids 380-430 over 250 times.


----------------------------------------------------------------------------------------------------
--10. Within the film table, how many rating categories are there? And what rating has the most
--movies total?

select rating, count(rating)
from film
group by rating
order by count(rating) desc

--There are 5 rating categories. PG-13 has the most movies, at 223.










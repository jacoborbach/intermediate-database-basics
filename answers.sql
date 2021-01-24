select * from invoice i
join invoice_line on invoice_line.invoice_id = i.invoice_id
where unit_price > .99

SELECT i.invoice_date, c.first_name, c.last_name, i.total
FROM invoice i
JOIN customer c ON i.customer_id = c.customer_id;

SELECT c.first_name, c.last_name, e.first_name, e.last_name
FROM customer c
JOIN employee e ON c.support_rep_id = e.employee_id;

SELECT al.title, ar.name
FROM album al
JOIN artist ar ON al.artist_id = ar.artist_id;

SELECT pt.track_id
FROM playlist_track pt
JOIN playlist p ON p.playlist_id = pt.playlist_id
WHERE p.name = 'Music';

SELECT t.name
FROM track t
JOIN playlist_track pt ON pt.track_id = t.track_id
WHERE pt.playlist_id = 5;

SELECT t.name, p.name
FROM track t
JOIN playlist_track pt ON t.track_id = pt.track_id
JOIN playlist p ON pt.playlist_id = p.playlist_id;

SELECT t.name, a.title
FROM track t
JOIN album a ON t.album_id = a.album_id
JOIN genre g ON g.genre_id = t.genre_id
WHERE g.name = 'Alternative & Punk';

	

SELECT *
FROM invoice
WHERE invoice_id IN ( SELECT invoice_id FROM invoice_line WHERE unit_price > 0.99 );

SELECT *
FROM playlist_track
WHERE playlist_id IN ( SELECT playlist_id FROM playlist WHERE name = 'Music' );

SELECT name
FROM track
WHERE track_id IN ( SELECT track_id FROM playlist_track WHERE playlist_id = 5 );

SELECT *
FROM track
WHERE genre_id IN ( SELECT genre_id FROM genre WHERE name = 'Comedy' );
SELECT *
FROM track
WHERE album_id IN ( SELECT album_id FROM album WHERE title = 'Fireball' );

SELECT *
FROM track
WHERE album_id IN ( 
  SELECT album_id FROM album WHERE artist_id IN ( 
    SELECT artist_id FROM artist WHERE name = 'Queen'
  )
); 


update customer
set fax = null
where fax is not null

update customer
set company = ‘self’
where company is null

update customer
set last_name = 'Thompson'
where last_name = 'Barnett' AND first_name = 'Julia'

UPDATE customer
SET support_rep_id = 4
WHERE email = 'luisrojas@yahoo.cl';

UPDATE track
SET composer = 'The darkness around us'
WHERE genre_id = ( SELECT genre_id FROM genre WHERE name = 'Metal' )
AND composer IS null;

SELECT COUNT(*), g.name
FROM genre g
JOIN track on track.genre_id = g.genre_id
GROUP BY g.name

SELECT COUNT(*), g.name
FROM genre g
JOIN track on track.genre_id = g.genre_id
WHERE g.name IN ('Pop', 'Rock')
GROUP BY g.name

select a.name, count(*) from artist a
join album am on am.artist_id = a.artist_id
group by a.name


select distinct composer from track

SELECT DISTINCT billing_postal_code
FROM invoice;

select DISTINCT company
FROM customer;

delete from practice_delete
where type = 'bronze'

delete from practice_delete
where type = 'silver'

DELETE 
FROM practice_delete 
WHERE value = 150;



create table users (
	id serial primary key,
  name varchar,
  email varchar
  );
  
create table products (
  id serial primary key,
  name varchar,
  price int
  );
 
create table orders (
  id serial primary key,
  product_id int references products(id),
  OrderDate date ,
  quantity int
  );

insert into users (name, email)
values (
  'Jake',
  'jacob@gmail.com'
  ),
  
  ('Rach',
  'rach@gmail.com'),
  
  ('Nay',
  'nay@gmail.com');

  
  insert into products (name, price)
values (
  'Cheese',
  10
  ),
  
  ('Marijuana',
  15),
  
  ('Milk',
  5;
  
insert into orders (quantity, orderdate, product_id)
values (4, '2019-01-22', 1),
(2, '2014-02-05', 1),
(8, '2019-12-19', 2)


select * from products p
join orders o on p.id=o.product_id
order by orderdate asc
limit 1

select * from orders

select p.name, price*quantity as "Total Price", quantity, price from orders o
join products p on p.id = o.product_id
limit 1

alter table products
add user_id int references users(id);

update products
set user_id =5
where id = 3;

update products
set user_id =6
where id = 2;

update products
set user_id =4
where id = 1;

select * from orders o
join products p on o.product_id = p.id
join users u on u.id= p.user_id
where p.user_id = 4;

select u.name, count(*) from orders o
join products p on o.product_id = p.id
join users u on u.id= p.user_id
group by u.name

--diamond

select u.name, sum((o.quantity*p.price)) as "total" from orders o
join products p on o.product_id = p.id
join users u on u.id= p.user_id
group by u.name
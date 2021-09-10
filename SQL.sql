-- ÖDEV 1

--film tablosunda bulunan title ve description sütunlarındaki verileri sıralayınız.
SELECT title, description FROM film ;
--film tablosunda bulunan tüm sütunlardaki verileri film uzunluğu (length) 60 dan büyük VE 75 ten küçük olma koşullarıyla sıralayınız.
SELECT * FROM film WHERE length > 60 AND length < 75 ;
--film tablosunda bulunan tüm sütunlardaki verileri rental_rate 0.99 VE replacement_cost 12.99 VEYA 28.99 olma koşullarıyla sıralayınız.
SELECT * FROM film WHERE rental_rate = 0.99 AND replacement_cost = 12.99 OR replacement_cost = 28.99 ;
--customer tablosunda bulunan first_name sütunundaki değeri 'Mary' olan müşterinin last_name sütunundaki değeri nedir?
SELECT last_name FROM customer where first_name = 'Mary';
--film tablosundaki uzunluğu(length) 50 ten büyük OLMAYIP aynı zamanda rental_rate değeri 2.99 veya 4.99 OLMAYAN verileri sıralayınız.
SELECT * FROM film WHERE length !> 50 AND NOT rental_rate = 2.99 OR NOT rental_rate = 4.99 ; 


-- ÖDEV 2

--film tablosunda bulunan tüm sütunlardaki verileri replacement cost değeri 12.99 dan büyük eşit ve 16.99 küçük olma koşuluyla sıralayınız (BETWEEN - AND yapısını kullanınız.)
SELECT * FROM film
WHERE replacement_cost BETWEEN 12.99 AND 16.98 ;
--actor tablosunda bulunan first_name ve last_name sütunlardaki verileri first_name 'Penelope' veya 'Nick' veya 'Ed' değerleri olması
--koşuluyla sıralayınız.(IN operatörünü kullanınız.)
SELECT first_name, last_name FROM actor
WHERE first_name IN ('Penelope','Nick','Ed') ;
--film tablosunda bulunan tüm sütunlardaki verileri rental_rate 0.99,2.99,4.99 VE replacement_cost 12.99, 15.99, 28.99 olma koşullarıyla sıralayınız.(IN operatörünü kullanınız)
SELECT * FROM film
WHERE rental_rate IN (0.99,2.99,4.99) AND replacement_cost IN (12.99,15.99,28.99) ;


-- ÖDEV 3

--country tablosunda bulunan country sütunundaki ülke isimlerinden 'A' karakteri ile başlayıp 'a' karakteri ile sonlananları sıralayınız.
SELECT country FROM country 
WHERE country LIKE 'A%a';
--country tablosunda bulunan country sütunundaki ülke isimlerinden en az 6 karakterden oluşan ve sonu 'n' karakteri ile sonlananları sıralayınız.
SELECT country FROM country 
WHERE country LIKE '______%n' ;
--film tablosunda bulunan title sütunundaki film isimlerinden en az 4 adet büyük ya da küçük harf farketmesizin 'T' karakteri içeren film isimlerini sıralayınız.
SELECT title FROM film
WHERE title ILIKE '%t%t%t%T' ;
--film tablosunda bulunan tüm sütunlardaki verilerden title 'C' karakteri ile başlayan ve uzunluğu (length) 90 dan büyük olan ve rental_rate 2.99 olan verileri sıralayınız.
SELECT * FROM film
WHERE title LIKE 'C%' AND length > 90 AND rental_rate = 2.99 ;


-- ÖDEV 4

--film tablosunda bulunan replacement_cost sütununda bulunan birbirinden farklı değerleri sıralayınız.
SELECT DISTINCT replacement_cost FROM film ;
--film tablosunda bulunan replacement_cost sütununda birbirinden farklı kaç tane veri vardır?
SELECT COUNT(DISTINCT replacement_cost) FROM film ;
--film tablosunda bulunan film isimlerinde (title) kaç tanesini T karakteri ile başlar ve aynı zamanda rating 'G' ye eşittir?
SELECT COUNT(*) FROM film 
WHERE title LIKE 'T%' AND rating = 'G';
--country tablosunda bulunan ülke isimlerinden (country) kaç tanesi 5 karakterden oluşmaktadır?
SELECT COUNT(*) FROM country 
WHERE country LIKE '_____' ;
--city tablosundaki şehir isimlerinin kaçtanesi 'R' veya r karakteri ile biter?
SELECT COUNT(*) FROM city 
WHERE city ILIKE '%R';


-- ÖDEV 5

--film tablosunda bulunan ve film ismi (title) 'n' karakteri ile biten en uzun (length) 5 filmi sıralayınız.
SELECT * FROM film 
WHERE title LIKE '%n'
ORDER BY length DESC 
LIMIT 5 ;
--film tablosunda bulunan ve film ismi (title) 'n' karakteri ile biten en kısa (length) ikinci 5 filmi sıralayınız.
SELECT * FROM film 
WHERE title LIKE '%n'
ORDER BY length ASC
OFFSET 5
LIMIT 5 ;
--customer tablosunda bulunan last_name sütununa göre azalan yapılan sıralamada store_id 1 olmak koşuluyla ilk 4 veriyi sıralayınız.
SELECT * FROM customer 
WHERE store_id = 1
ORDER BY last_name DESC
LIMIT 4 ;


--ÖDEV 6

--film tablosunda bulunan rental_rate sütunundaki değerlerin ortalaması nedir?
SELECT AVG(rental_rate) FROM film ;
--film tablosunda bulunan filmlerden kaç tanesi 'C' karekteri ile başlar?
SELECT COUNT(*) FROM film 
WHERE title LIKE 'C%';
--film tablosunda bulunan filmlerden rental_rate değeri 0.99 a eşit olan en uzun (length) film kaç dakikadır?
SELECT MAX(length) FROM film 
WHERE rental_rate = 0.99 ;
--film tablosunda bulunan filmlerin uzunluğu 150 dakikadan büyük olanlarına ait kaç farklı replacement_cost değeri vardır?
SELECT COUNT(DISTINCT replacement_cost) FROM film 
WHERE length > 150 ;


--ÖDEV 7

--film tablosunda bulunan filmleri rating değerlerine göre gruplayınız.
SELECT rating, COUNT(*) FROM film 
GROUP BY rating ;
--film tablosunda bulunan filmleri replacement_cost sütununa göre grupladığımızda 
--film sayısı 50 den fazla olan replacement_cost değerini ve karşılık gelen film sayısını sıralayınız.
SELECT replacement_cost, COUNT(*) FROM film
GROUP BY replacement_cost 
HAVING  COUNT(*) > 50 ;
--customer tablosunda bulunan store_id değerlerine karşılık gelen müşteri sayılarını nelerdir?
SELECT store_id, COUNT(*) FROM customer
GROUP BY store_id ;
--city tablosunda bulunan şehir verilerini country_id sütununa göre gruplandırdıktan sonra 
--en fazla şehir sayısı barındıra country_id bilgisini ve şehir sayısını paylaşınız.
SELECT country_id, COUNT(*) FROM city
GROUP BY country_id
ORDER BY COUNT(*) DESC 
LIMIT 1 ;


--ÖDEV 8

--test veritabanınızda employee isimli 
--sütun bilgileri id(INTEGER), name VARCHAR(50), birthday DATE, email VARCHAR(100) olan bir tablo oluşturalım.
CREATE TABLE employee (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	birthday DATE,
	email VARCHAR(100)
) ;
--Oluşturduğumuz employee tablosuna 'Mockaroo' servisini kullanarak 50 adet veri ekleyelim.
insert into employee (name, email, birthday) values ('Rip', null, '1936-04-26');
insert into employee (name, email, birthday) values ('Gianina', 'glotwich1@yelp.com', '1905-08-20');
insert into employee (name, email, birthday) values ('Katrinka', null, null);
insert into employee (name, email, birthday) values ('Euell', 'esliney3@4shared.com', null);
insert into employee (name, email, birthday) values ('Betteann', 'bantonsen4@360.cn', '1924-11-18');
insert into employee (name, email, birthday) values ('Bord', 'bgino5@slideshare.net', null);
insert into employee (name, email, birthday) values ('Myrtia', 'mdurie6@msn.com', '1948-11-25');
insert into employee (name, email, birthday) values ('Gus', 'gbaybutt7@virginia.edu', '1949-03-17');
insert into employee (name, email, birthday) values ('Kimmie', null, '1925-08-25');
insert into employee (name, email, birthday) values ('Keriann', 'kganny9@psu.edu', '1957-07-24');
insert into employee (name, email, birthday) values ('Shawnee', 'svonhindenburga@independent.co.uk', '1905-04-03');
insert into employee (name, email, birthday) values ('Benedetta', 'bemblowb@addthis.com', '1947-10-06');
insert into employee (name, email, birthday) values ('Dayle', 'ddewsnapc@yahoo.co.jp', '1920-05-16');
insert into employee (name, email, birthday) values ('Lennard', null, '1915-03-08');
insert into employee (name, email, birthday) values ('Wash', null, '1958-05-16');
insert into employee (name, email, birthday) values ('Yetta', 'ybailissf@github.com', '1906-07-09');
insert into employee (name, email, birthday) values ('Trixy', null, '1900-06-04');
insert into employee (name, email, birthday) values ('Kerry', 'kmaaszeh@illinois.edu', '1918-07-18');
insert into employee (name, email, birthday) values ('Elisa', 'emcpartlingi@delicious.com', null);
insert into employee (name, email, birthday) values ('Rubetta', 'rmcglashanj@infoseek.co.jp', '1948-10-27');
insert into employee (name, email, birthday) values ('Isis', 'iimmk@rakuten.co.jp', '1965-01-25');
insert into employee (name, email, birthday) values ('Skelly', 'sdodshunl@constantcontact.com', null);
insert into employee (name, email, birthday) values ('Benedicta', 'bdowdallm@wikipedia.org', '1988-03-18');
insert into employee (name, email, birthday) values ('Cristy', 'cwoollastonn@dot.gov', '1935-05-23');
insert into employee (name, email, birthday) values ('Anitra', 'aclintono@goo.ne.jp', null);
insert into employee (name, email, birthday) values ('Hercules', 'hwestpfelp@nature.com', '1905-05-07');
insert into employee (name, email, birthday) values ('Michal', 'msnookesq@phpbb.com', null);
insert into employee (name, email, birthday) values ('Hashim', null, '1930-04-07');
insert into employee (name, email, birthday) values ('Reggie', 'rbrehauts@furl.net', null);
insert into employee (name, email, birthday) values ('Joete', 'jdolbyt@myspace.com', '1940-06-14');
insert into employee (name, email, birthday) values ('Agosto', null, '1951-05-27');
insert into employee (name, email, birthday) values ('Silvano', 'sgriffittv@de.vu', '1962-03-21');
insert into employee (name, email, birthday) values ('Ned', 'npirazziw@gizmodo.com', '1973-07-31');
insert into employee (name, email, birthday) values ('Alexio', 'ajacobsenx@weibo.com', null);
insert into employee (name, email, birthday) values ('Maddy', 'mradiny@house.gov', '1991-11-21');
insert into employee (name, email, birthday) values ('Bernardina', 'bhardypigginz@blogspot.com', '1985-07-31');
insert into employee (name, email, birthday) values ('Lorin', 'ljonczyk10@narod.ru', null);
insert into employee (name, email, birthday) values ('Georgina', 'gariss11@yellowbook.com', null);
insert into employee (name, email, birthday) values ('Luz', 'lattenborough12@quantcast.com', '1926-01-21');
insert into employee (name, email, birthday) values ('Kirby', null, '1923-06-21');
insert into employee (name, email, birthday) values ('Rhona', null, '1948-01-09');
insert into employee (name, email, birthday) values ('Fenelia', 'fwadge15@yale.edu', '1907-03-25');
insert into employee (name, email, birthday) values ('Dugald', 'dnoddles16@networksolutions.com', '1908-06-30');
insert into employee (name, email, birthday) values ('Yancey', 'yclackson17@eventbrite.com', null);
insert into employee (name, email, birthday) values ('Margaretta', 'mmaliffe18@imdb.com', '1926-06-04');
insert into employee (name, email, birthday) values ('Danika', 'dwisniewski19@pcworld.com', '1936-06-04');
insert into employee (name, email, birthday) values ('Bogey', 'bbeeble1a@php.net', null);
insert into employee (name, email, birthday) values ('Yoko', 'ytod1b@tripadvisor.com', '1982-12-22');
insert into employee (name, email, birthday) values ('Kimberley', 'kasche1c@cocolog-nifty.com', '1930-07-06');
insert into employee (name, email, birthday) values ('Nikkie', 'ncare1d@irs.gov', '1937-05-12');
--Sütunların her birine göre diğer sütunları güncelleyecek 5 adet UPDATE işlemi yapalım.
UPDATE employee
SET name = 'Merve'
WHERE id = 23
RETURNING *;

UPDATE employee
SET name = 'Özge'
WHERE id = 1
RETURNING *;

UPDATE employee
SET name = 'Mert'
WHERE name LIKE 'Q%'
RETURNING *;

UPDATE employee
SET id = 10
WHERE name ='Ali'
RETURNING *;

UPDATE employee
SET birthday = '2020-02-02'
WHERE id =20
RETURNING *;
--Sütunların her birine göre ilgili satırı silecek 5 adet DELETE işlemi yapalım.
DELETE FROM  employee
WHERE id = 23
RETURNING *;

DELETE FROM employee
WHERE id = 1
RETURNING *;

DELETE FROM employee
WHERE name LIKE 'Q%'
RETURNING *;

DELETE FROM employee
SET id = 10
RETURNING *;

DELETE FROM employee
WHERE id =20
RETURNING *;
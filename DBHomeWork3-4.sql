CREATE TABLE Customer (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(64) NOT NULL,
    type VARCHAR(7) ,
    city VARCHAR(32)
)

iNSERT INTO Customer(name ,type ,city)
VALUES
 ('Олег' , 'NEW' , 'Ленинград'),
 ('Евгений' , 'REGULAR' , 'Москва'),
 ('Александр' , 'REGULAR' , 'Ленинград')


UPDATE Customer
SET id = 1
WHERE name ='Дима';

UPDATE Customer
SET city = 'Санкт-Петербург'
WHERE city ='Ленинград';

DELETE FROM Customer
WHERE id = 2;


SELECT * FROM Customer
WHERE city = 'Санкт-Петербург'
ORDER BY name;
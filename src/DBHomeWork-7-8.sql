ALTER TABLE books
    ADD COLUMN price INT;

UPDATE books
SET price = 500
WHERE id = 1;

UPDATE books
SET price = 700
WHERE id = 2;

UPDATE books
SET price = 300
WHERE id = 3;

SELECT
    ROUND(AVG(price)) AS average_price,
    MIN(price) AS min_price,
    MAX(price) AS max_price
FROM books;

SELECT
    a.name AS author_name,
    COUNT(ba.book_id) AS book_count
FROM authors a
         LEFT JOIN book_authors ba ON a.id = ba.author_id
GROUP BY a.id, a.name;

SELECT
    a.name AS author_name,
    COUNT(b.id) AS book_count,
    ROUND(AVG(b.price)) AS average_price
FROM authors a
         LEFT JOIN book_authors ba ON a.id = ba.author_id
         LEFT JOIN books b ON ba.book_id = b.id
GROUP BY a.id, a.name;

INSERT INTO authors (name)
VALUES ('Автор 4'),
       ('Автор 5');
SELECT a.name AS author_name
FROM authors a
         LEFT JOIN book_authors ba ON a.id = ba.author_id
WHERE ba.book_id IS NULL;


SELECT a.name AS author_name
FROM authors a
         LEFT JOIN book_authors ba ON a.id = ba.author_id
GROUP BY a.id, a.name
HAVING COUNT(ba.book_id) = 0;
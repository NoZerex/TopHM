ALTER TABLE books
    ADD COLUMN page_count INT;


UPDATE books
SET
    page_count = 300,
    price = 500,
    publication_year = 2025 ,
    copies_available = 15
WHERE id = 1;


UPDATE books
SET
    page_count = 450,
    price = 700,
    publication_year = 2020,
    copies_available = 10
WHERE id = 2;


UPDATE books
SET
    page_count = 250,
    price = 300,
    publication_year = 2002,
    copies_available = 50
WHERE id = 3;



SELECT *
FROM books
WHERE page_count > (SELECT AVG(page_count) FROM books);

ALTER TABLE books
    ADD COLUMN copies_available INT,
ADD COLUMN publication_year INT;


SELECT *
FROM books
WHERE publication_year = (SELECT MAX(publication_year) FROM books);


SELECT *
FROM (
         SELECT id, title, (copies_available * price) AS total_value
         FROM books
     ) AS sub
WHERE total_value > 1000
ORDER BY total_value DESC;

SELECT
    b.title AS book_title,
    b.publication_year,
    a.name AS author_name,
    CASE
        WHEN b.publication_year >= 2025 THEN 'Новая'
        WHEN b.publication_year BETWEEN 2015 AND 2024 THEN 'Недавняя'
        ELSE 'Старая'
        END AS age_category
FROM books b
         JOIN book_authors ba ON b.id = ba.book_id
         JOIN authors a ON ba.author_id = a.id
ORDER BY b.publication_year DESC, a.name;

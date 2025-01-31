CREATE TABLE authors
(
    id   BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);


CREATE TABLE publishers
(
    id   BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);


CREATE TABLE books
(
    id           BIGSERIAL PRIMARY KEY,
    title        VARCHAR(255) NOT NULL,
    publisher_id INT REFERENCES publishers (id) ON DELETE CASCADE
);


CREATE TABLE book_authors
(
    book_id   INT REFERENCES books (id) ON DELETE CASCADE,
    author_id INT REFERENCES authors (id) ON DELETE CASCADE,
    PRIMARY KEY (book_id, author_id)
);


INSERT INTO authors (name)
VALUES ('Автор 1'),
       ('Автор 2'),
       ('Автор 3');


INSERT INTO publishers (name)
VALUES ('Издательство 1'),
       ('Издательство 2');

INSERT INTO books (title, publisher_id)
VALUES ('Книга 1', 1),
       ('Книга 2', 1),
       ('Книга 3', 2);


INSERT INTO book_authors (book_id, author_id)
VALUES (1, 1),
       (1, 2),
       (2, 3),
       (3, 1);


SELECT books.title AS book_title, publishers.name AS publisher_name
FROM books
         JOIN publishers ON books.publisher_id = publishers.id;
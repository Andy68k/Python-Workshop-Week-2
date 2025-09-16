/*--1. Basic Selection: Retrieve the titles and publication years of all books published after 2000, ordered by publication year (newest first).
SELECT title, publication_year
FROM books
WHERE publication_year > '2000'
ORDER BY publication_year DESC;

--2. Filtering: Find all books with more than 5 copies owned in the fiction genre (genre_id = 1).
SELECT *
FROM books
WHERE genre_id = 1 AND copies_owned > 5;


--3. Pattern Matching: List all books whose titles contain the word "History".
SELECT *
FROM books
WHERE title lIKE '%History%';



--4. JOIN Operations: Display loan information (loan_id, checkout_date, due_date) along with patron details (first_name, last_name, email) for all loans made in January 2023.
SELECT
	loans.loan_id,
	loans.checkout_date,
	loans.due_date,
	patrons.first_name,
	patrons.last_name,
	patrons.email
FROM
	loans
INNER JOIN
	patrons ON loans.patron_id = patrons.patron_id
WHERE
	loans.checkout_date >= '2023-01-01' AND loans.checkout_date < '2023-01-31';
*/

	
	
--5. Multi-table JOIN: Show book details (title, author's full name, genre_name) for each loan, along with the checkout_date and due_date.
SELECT
	books.title,
	authors.first_name,
	authors.last_name,
	genres.genre_name,
	loans.checkout_date,
	loans.due_date
FROM 
	loans
JOIN
	books ON loans.book_id = books.book_id
JOIN 
	authors ON books.author_id = authors.author_id
JOIN	
	genres ON books.genre_id = genres.genre_id;



	


	

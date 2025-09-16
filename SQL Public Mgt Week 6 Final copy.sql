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


--6. Self JOIN: Find pairs of patrons who live in the same city. Show both patrons' names and their city.
SELECT 
    p1.first_name AS patron1_first_name,
    p1.last_name  AS patron1_last_name,
    p2.first_name AS patron2_first_name,
    p2.last_name  AS patron2_last_name,
    p1.city
FROM Patrons p1
JOIN Patrons p2
    ON p1.city = p2.city
   AND p1.patron_id < p2.patron_id
ORDER BY p1.city, patron1_last_name, patron2_last_name;


--7. Multi-table JOIN with filtering: Find all fiction books (genre_id = 1) that have been borrowed, along with the patron name and the branch where they were borrowed from.
SELECT 
    books.title AS book_title,
    patrons.first_name || ' ' || patrons.last_name AS patron_name,
    branches.branch_name
FROM books 
JOIN 
    loans ON books.book_id = loans.book_id
JOIN   
    patrons ON loans.patron_id = patrons.patron_id
JOIN  
    branches ON loans.branch_id = branches.branch_id
WHERE books.genre_id = 1;


--8. COUNT aggregation: Count the number of books in each genre category.
SELECT 
    genre_id,
    COUNT(*) AS book_count
FROM books
GROUP BY genre_id;


--9. Multiple aggregations: Calculate the average, minimum, and maximum loan duration (days between checkout and return) for each library branch. Include only returned books.
SELECT 
    branches.branch_name,
    ROUND(AVG(julianday(loans.return_date) - julianday(loans.checkout_date)), 1) AS avg_duration,
    MIN(julianday(loans.return_date) - julianday(loans.checkout_date)) AS min_duration,
    MAX(julianday(loans.return_date) - julianday(loans.checkout_date)) AS max_duration
FROM loans 
JOIN branches ON l.branch_id = br.branch_id
WHERE loans.return_date IS NOT NULL
GROUP BY branches.branch_name;


--10. Conditional aggregation: Find patrons with overdue books (due_date < CURRENT_DATE and return_date = ' '), along with the count of overdue books they have.
SELECT 
    patrons.first_name || ' ' || patrons.last_name AS patron_name,
    COUNT(*) AS overdue_count
FROM loans 
JOIN patrons  
    ON loans.patron_id = patrons.patron_id
WHERE loans.return_date IS NULL
  AND loans.due_date < DATE('now')
GROUP BY patrons.patron_id, patron_name
ORDER BY overdue_count DESC;


--11. Time-based analysis: Analyze monthly borrowing trends. Show the year, month, number of loans, and number of unique patrons for each month.
SELECT 
    strftime('%Y', loans.checkout_date) AS year,
    strftime('%m', loans.checkout_date) AS month,
    COUNT(*) AS total_loans,
    COUNT(DISTINCT loans.patron_id) AS unique_patrons
FROM loans 
GROUP BY year, month
ORDER BY year, month;
*/
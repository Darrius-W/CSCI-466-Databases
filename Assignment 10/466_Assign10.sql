
--Gotta get both authors in there

SELECT DISTINCT Title, AuthorLast, AuthorFirst, Price
FROM Wrote
JOIN Book USING(BookCode)
JOIN Author USING(AuthorNum)
GROUP BY Title
ORDER BY Sequence;



--for the book
SELECT DISTINCT BookCode, Title, AuthorLast, AuthorFirst, Price
FROM Wrote
JOIN Book USING(BookCode)
JOIN Author USING(AuthorNum)
WHERE AuthorLast = 'Rowling';

--for the on hand
SELECT OnHand, BranchName, BranchLocation
FROM Wrote
JOIN Inventory USING(BookCode)
JOIN Branch USING(BranchNum)
JOIN Author USING(AuthorNum)
WHERE AuthorLast = 'Rowling';

--Total
SELECT DISTINCT BookCode, Title, AuthorLast, AuthorFirst, Price, OnHand, BranchName, BranchLocation
FROM Wrote
JOIN Book USING(BookCode)
JOIN Inventory USING(BookCode)
JOIN Branch USING(BranchNum)
JOIN Author USING(AuthorNum)
WHERE AuthorLast = 'Rowling';



SELECT DISTINCT BookCode, Title, AuthorLast, AuthorFirst, Price, OnHand, BranchName, BranchLocation
FROM Wrote
JOIN Book USING(BookCode)
JOIN Inventory USING(BookCode)
JOIN Branch USING(BranchNum)
JOIN Author USING(AuthorNum)
WHERE Title = 'Harry Potter';

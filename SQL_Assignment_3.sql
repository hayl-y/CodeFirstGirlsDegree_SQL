-- + Create a database with at least 3 tables with several columns, use good naming conventions /
-- + Link tables using primary and foreign keys effectively /
-- + Populate the database with approximately 10 rows of mock data for table to show use of DML commands. /
-- + Keep in your code all commands you used set up your database, tables and all demo queries. You can comment out queries you do not want to be auto run
-- + Use at least 3 different data types while creating tables /
-- + Use at least 2 constraints while creating tables, not including primary key or foreign key /
-- + Use at least 3 queries to insert data /
-- + Use at least 5 queries to retrieve data /
-- + Use at least 1 query to delete data  /
-- + Use at least 2 aggregate functions /
-- + Use at least 2 joins /
-- + Use at least 2 in-built functions /
-- + Use data sorting for majority of queries with ORDER BY /
-- + Create and use one stored procedure or function to achieve a goal /
-- + Normalise the DB by splitting the data out in tables where appropriate and not containing any duplicate data /
-- + Have a scenario of use /



-- Introducing BookWonders Library
CREATE DATABASE BookWonders_Library;


-- Using the database
USE BookWonders_Library;


-- Create the tables, with the columns
CREATE TABLE Authors(
	AuthorID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    Surname VARCHAR(50) NOT NULL
);

CREATE TABLE Books( -- Links to Authors Table
    BookID INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    ISBN VARCHAR(14) UNIQUE, -- International Standard Book Number [13 numbers and one dash hence varchar]
    PublicationYear INT,
    AuthorID INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

CREATE TABLE Users(
	UserID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    Surname VARCHAR(50) NOT NULL
);

CREATE TABLE Loans( -- Links with Books & Users Tables
    LoanID INT PRIMARY KEY,
    BookID INT CHECK (BookID > 100),
    UserID INT,
    LoanDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);



-- Add data into the tables
INSERT INTO Authors 
	(AuthorID, FirstName, Surname)
VALUES
    (1, 'Philippa', 'Gregory'),
    (2, 'Alan Alexander', 'Milne'),
    (3, 'Harper', 'Lee'),
    (4, 'Stephen', 'Fry'),
    (5, 'Jessie', 'Inchauspe'),
    (6, 'Malorie', 'Blackman'),
    (7, 'Francis', 'Scott Fitzgerald'),
    (8, 'Jane', 'Austin'),
    (9, 'Richard', 'Osman'),
    (10, 'Milly', 'Bobby Brown');

INSERT INTO Books 
	(BookID, Title, ISBN, PublicationYear, AuthorID)
VALUES
    (101, 'The White Princess', '978-0857207517', 2013, 1),
    (102, 'Winnie The Pooh', '978-1405281317', 1926, 2),
    (103, 'To Kill a Mockingbird', '978-0099549482', 1960, 3),
    (104, 'Mythos', '978-0718188726', 2017, 4),
    (105, 'Glucose Revolution', '978-1780725239', 2022, 5),
    (106, 'Noughts & Crosses', '978-0141378640', 2017, 6),
    (107, 'The Great Gatsby', '978-1840221886', 1925, 7),
    (108, 'Pride and Prejudice', '978-1840221930', 1913, 8),
    (109, 'The Last Devil to Die', '978-0241512449', 2023, 9),
    (110, 'Nineteen Steps', '978-0008530266', 2023, 10),
    (111, 'Troy', '978-1405944465', 2020, 4),
    (112, 'Heroes', '978-1405940368', 2018, 4);
    

INSERT INTO Users
	(UserID, FirstName, Surname)
VALUES 
	(1001, 'Pink', 'Smith'), 
	(1002, 'Ruby Frost', 'Gala'), 
	(1003, 'Oakley', 'Cox'),
    (1004, 'Snap', 'Cortland'),
    (1005, 'Mutsu', 'Gravenstein'),
    (1006, 'Macoun', 'Spitzenburg'),
    (1007, 'Gran', 'Mcintosh'),
    (1008, 'Spy', 'York');
    
INSERT INTO Loans -- Date format: YYYY-MM-DD
    (LoanID, BookID, UserID, LoanDate, ReturnDate)
VALUES
    (201, 101, 1001, '2023-08-01', '2023-08-15'),
    (202, 104, 1005, '2023-08-17', '2023-08-31'),
    (203, 102, 1006, '2023-07-15', '2023-07-29'),
    (204, 107, 1003, '2023-09-25', '2023-10-09'),
    (205, 106, 1005, '2023-09-25', '2023-10-09'),
    (206, 103, 1008, '2023-09-30', '2023-10-14'),
    (207, 104, 1006, '2023-09-30', '2023-10-14'),
    (208, 104, 1004, '2023-09-30', '2023-10-14'),
    (209, 102, 1003, '2023-09-25', '2023-10-09'),
    (210, 111, 1006, '2023-09-30', '2023-10-14'),
    (211, 112, 1001, '2023-09-30', '2023-10-14');



-- Update: User got married and need to change surname
UPDATE Users
SET Surname = 'Cox'
WHERE UserID = 1004;
    
   
   
-- Add a new column for Books [GENRES]
CREATE TABLE Genres (
	GenreID INT PRIMARY KEY,
	GenreName VARCHAR(50) NOT NULL
);
    
INSERT INTO Genres
	(GenreID, GenreName)
VALUES
	(301, 'Historical Fiction'),
    (302, 'Children Literature'),
    (303, 'American Literature'),
    (304, 'Ficton'),
    (305, 'Health & Wellness'),
    (306, 'Young Adult Ficton'),
    (307, 'Mystery');


-- Add in Data for Books Table under column Genres
ALTER TABLE Books
ADD COLUMN GenreID INT;

ALTER TABLE Books
ADD FOREIGN KEY (GenreID) REFERENCES Genres(GenreID);

UPDATE Books
SET	GenreID = 301
WHERE BookID = 101;

UPDATE Books
SET	GenreID = 302
WHERE BookID = 102;

UPDATE Books
SET	GenreID = 303
WHERE BookID = 103;

UPDATE Books
SET	GenreID = 304
WHERE BookID = 104;

UPDATE Books
SET	GenreID = 305
WHERE BookID = 105;

UPDATE Books
SET	GenreID = 306
WHERE BookID = 106;

UPDATE Books
SET	GenreID = 303
WHERE BookID = 107;

UPDATE Books
SET	GenreID = 304
WHERE BookID = 108;

UPDATE Books
SET	GenreID = 307
WHERE BookID = 109;

UPDATE Books
SET	GenreID = 301
WHERE BookID = 110;

    
    
-- Retrieve data + Joins + Aggregate Functions + inBuilt Functions + OrderBy
SELECT u.FirstName, u.Surname
From Users u
ORDER BY u.Surname asc;

SELECT b.Title AS BookTitle, b.GenreID -- NB: Troy & Heroes do NOT have a genre attached (yet) hence will be NULL
From Books b
ORDER BY b.Title asc;

SELECT b.Title AS BookTitle, g.GenreName, b.GenreID
FROM Books b
RIGHT JOIN Genres g ON b.GenreID = g.GenreID; -- To show all books catergorised into their genres, and those that need to be sorted

SELECT b.Title, b.PublicationYear
FROM Books b
WHERE b.PublicationYear = 2023
ORDER BY b.Title asc;

SELECT b.Title AS BookTitle, a.FirstName AS Author_FirstName, a.Surname AS Author_Surname
FROM Books b
RIGHT JOIN Authors a ON b.AuthorID = a.AuthorID -- Want to show all books, will help highlight which book author's need to be added
ORDER BY a.Surname asc;

SELECT u.FirstName AS User_FirstName, u.Surname AS User_Surname, 
COUNT(l.LoanID) AS NumberOfLoans
FROM Users u
LEFT JOIN Loans l ON u.UserID = l.UserID --  All Loans to be mentioned, help library track how many books are out
GROUP BY u.FirstName, u.Surname
ORDER BY u.Surname asc;

SELECT ROUND(AVG(b.PublicationYear)) AS AveragePublicationYear -- Round to an int. as it is a year
FROM Books b;

SELECT b.Title AS BookTitle, b.PublicationYear
FROM Books b
ORDER BY b.PublicationYear desc;

SELECT a.FirstName, a.Surname, b.Title AS BookTitle
FROM Authors a
INNER JOIN Books b ON a.AuthorID = b.AuthorID
WHERE a.FirstName = 'Stephen' AND a.Surname = 'Fry'
GROUP BY a.FirstName, a.Surname, b.Title
ORDER BY b.Title asc;



-- Delete Data: Delete any loans that have been returned AND more than 30 days ago
DELETE FROM Loans
WHERE ReturnDate <= DATE_SUB(NOW(), INTERVAL 30 DAY);

-- Check data deleted [WILDCARD REQUIRED] --
SELECT *
From Loans l
ORDER BY l.LoanDate asc;



-- Normalisation
ALTER TABLE Books
DROP FOREIGN KEY books_ibfk_2; -- Must drop foreign key first before dropping column GenreID [ERROR 1828]

ALTER TABLE Books
DROP COLUMN GenreID;

-- Check the column has been dropped [WILDCARD REQUIRED] --
SELECT *
FROM Books; 

CREATE TABLE BooksGenres (
    BookID INT,
    GenreID INT,
    PRIMARY KEY (BookID, GenreID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (GenreID) REFERENCES Genres(GenreID)
);

INSERT INTO BooksGenres
	(BookID, GenreID)
VALUES
	(101, 301),
    (102, 302),
    (103, 303),
    (104, 304),
    (105, 305),
    (106, 306),
    (107, 303),
    (108, 304),
    (109, 307),
    (110, 301),
    (111, 304),
    (112, 304);

-- Check Whole Book Genres Table [WILDCARD REQUIRED] --
SELECT *
FROM BooksGenres bg;

SELECT bg.BookID, b.Title AS BookTitle, g.GenreName, bg.GenreID
FROM BooksGenres bg
INNER JOIN Books b ON bg.BookID = b.BookID
INNER JOIN Genres g ON bg.GenreID = g.GenreID
ORDER BY g.GenreName asc;



-- Store Procedure/ Function
DELIMITER //
CREATE PROCEDURE 
CheckAvailability(
IN bookTitle VARCHAR(255), 
OUT available BOOLEAN)
BEGIN
    DECLARE bookCount INT;
    SELECT COUNT(*) INTO bookCount FROM Loans l
    INNER JOIN Books b ON l.BookID = b.BookID
    WHERE b.Title = bookTitle AND l.ReturnDate IS NULL;
    
    IF bookCount > 0 THEN
        SET available = FALSE;
    ELSE
        SET available = TRUE;
    END IF;
END //
DELIMITER ;

SET @isAvailable = FALSE;
CALL CheckAvailability('The Great Gatsby', @isAvailable);
SELECT @isAvailable AS 'Is The Great Gatsby Available?';


-- Get latest loan number, increase by one, insert a new loan into table, check if book is available, insert loan book into table
START TRANSACTION;

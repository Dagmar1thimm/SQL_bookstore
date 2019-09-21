
CREATE DATABASE db_bookstore;

USE db_bookstore;
--Test


CREATE TABLE tbl_LIBRARY_BRANCH (
LIBRARY_BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
LIBRARY_BranchName varchar (50) NOT NULL,
LIBRARY_Address varchar (50) NOT NULL
);

INSERT INTO tbl_LIBRARY_BRANCH
(LIBRARY_BranchName, LIBRARY_Address)
VALUES
('Sharpstown', '178 Mainstreet'),
('Central', '23 Upperroad'),
('Libro', '456 Twelvemiles'),
('Meyers','76 Centralstreet');



CREATE TABLE tbl_PUBLISHER (
PUBLISHER_PublisherName_ID varchar (50) PRIMARY KEY NOT NULL,
PUBLISHER_Address varchar (50) NOT NULL,
PUBLISHER_Phone varchar (50) NOT NULL
);

INSERT INTO tbl_PUBLISHER
(PUBLISHER_PublisherName_ID, PUBLISHER_Address, PUBLISHER_Phone)
VALUES
('Eric','23 Moonroad','232-345'),
('Fred','52 Bikeway','982-371'),
('Anni','98 Musicroad', '392-404'),
('Carla','61 Highway', '557-288');



CREATE TABLE tbl_BORROWER (
BORROWER_CardNo_ID INT PRIMARY KEY NOT NULL IDENTITY (1000,1),
BORROWER_Name varchar (50) NOT NULL,
BORROWER_Address varchar (50) NOT NULL,
BORROWER_Phone varchar (50) NOT NULL
);

INSERT INTO tbl_BORROWER
(BORROWER_Name, BORROWER_Address, BORROWER_Phone)
VALUES
('Ernst', '12 Lowroad', '339-009'),
('Lotta', '99 Sunway', '732-477'),
('Lila', '88 Soccerroad', '888-000'),
('Otto', '12 Mile', '666-444'),
('Anna', '13 Mile', '888-999'),
('Lloyd', '78 Mile', '222-777'),
('Mona', '36 Mile', '535-6260'),
('Mina', '44 Mile', '555-729'),
('Frank', '32 Mile', '628-118'),
('Gaby', '99 Mile', '774-188')
;


CREATE TABLE tbl_books (
	BOOKS_BookId INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BOOKS_Title VARCHAR(50) NOT NULL,
	BOOKS_PublisherName VARCHAR(50) NOT NULL CONSTRAINT fk_PUBLISHER_PublisherName_ID FOREIGN KEY REFERENCES tbl_PUBLISHER(PUBLISHER_PublisherName_ID) ON UPDATE CASCADE ON DELETE CASCADE, 
	);



INSERT INTO tbl_books
	(BOOKS_Title, BOOKS_PublisherName)
	VALUES
	('Lost Tribes', 'Eric'),
	('Fear', 'Fred'),
	('Secrets', 'Anni'),
	('Milarepa', 'Eric'),
	('Daga', 'Carla'),
	('Law', 'Eric'),
	('Human', 'Fred'),
	('Car', 'Anni'),
	('Robot', 'Carla'),
	('Dream', 'Fred'),
	('Ball', 'Anni'),
	('Tennis', 'Eric'),
	('Musik', 'Carla'),
	('Sharp', 'Fred'),
	('Knife', 'Eric'),
	('Cream', 'Eric'),
	('Siva', 'Anni'),
	('Ganesha', 'Carla'),
	('Ripa', 'Fred'),
	('Juval', 'Anni')
;


CREATE TABLE tbl_books_Author (
	AUTHOR_ID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	AUTHOR_BookID INT NOT NULL CONSTRAINT fk_AUTHOR_BOOKS_BookId FOREIGN KEY  REFERENCES tbl_books(BOOKS_BookId) ON UPDATE CASCADE ON DELETE CASCADE, 
	AUTHOR_AuthorName varchar(50) NOT NULL
	);

INSERT INTO tbl_books_Author
	(AUTHOR_BookID, AUTHOR_AuthorName)
	VALUES
	(1, 'John Krabag'),
	(2,'Stephen King'),
	(7,'Stephen King'),
	(4, 'Hans Noah'),
	(5,'Tim Strup'),
	(6, 'Klara Haus'),
	(3, 'Lisa Matthias'),
	(8, 'Marta Zilinsk'),
	(9, 'Elke Pfeiffer'),
	(10, 'Tom Riva'),
	(11, 'Tina Clue'),
	(12, 'Lisa Matthias'),
	(13, 'Marta Zilinsk'),
	(14, 'Elke Pfeiffer'),
	(15, 'Tom Riva'),
	(16, 'Tina Clue'),
	(17, 'Lisa Matthias'),
	(18, 'Marta Zilinsk'),
	(19, 'Elke Pfeiffer'),
	(20, 'Tom Riva')
;

SELECT *FROM  tbl_LIBRARY_BRANCH
SELECT *FROM tbl_PUBLISHER
SELECT *FROM tbl_BORROWER
SELECT *FROM tbl_books
SELECT *FROM tbl_books_Author
SELECT *FROM tbl_books_COPIES
SELECT *FROM tbl_books_LOANS

USE db_bookstore

DROP TABLE tbl_books_COPIES
CREATE TABLE tbl_books_COPIES (
COPIES_ID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
COPIES_BookID INT NOT NULL CONSTRAINT fk_COPIES_BookID FOREIGN KEY  REFERENCES tbl_books(BOOKS_BookId) ON UPDATE CASCADE ON DELETE CASCADE,
COPIES_BranchID INT NOT NULL CONSTRAINT fk_COPIES_BranchID FOREIGN KEY REFERENCES tbl_LIBRARY_BRANCH(LIBRARY_BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
COPIES_Number_Of_Copies INT NOT NULL
);

INSERT INTO tbl_books_COPIES
(COPIES_BookID, COPIES_BranchID, COPIES_Number_Of_Copies)
VALUES
	(1, 1, 5),
	(2, 2, 9),
	(7, 2, 8),
	(4, 3, 2),
	(5, 4, 4),
	(6, 2, 3),
	(3, 1, 3),
	(8, 4, 2),
	(9, 3, 2),
	(10, 3, 4),
	(11, 1, 2),
	(12, 3, 4),
	(13, 2, 5),
	(14, 4, 5),
	(15, 1, 4),
	(16, 2, 5),
	(17, 4, 3),
	(18, 2, 3),
	(19, 4, 4),
	(20, 2, 3)
;


CREATE TABLE tbl_books_LOANS (
LOANS_ID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
LOANS_BookID INT NOT NULL CONSTRAINT fk_LOANS_BookID FOREIGN KEY  REFERENCES tbl_books(BOOKS_BookId) ON UPDATE CASCADE ON DELETE CASCADE,
LOANS_BranchID INT NOT NULL CONSTRAINT fk_LOANS_BranchID FOREIGN KEY  REFERENCES tbl_LIBRARY_BRANCH(LIBRARY_BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
LOANS_CardNo INT NOT NULL CONSTRAINT fk_LOANS_CardNo FOREIGN KEY  REFERENCES tbl_BORROWER(BORROWER_CardNo_ID) ON UPDATE CASCADE ON DELETE CASCADE,
LOANS_DateOut varchar(50) NOT NULL,
LOANS_DateDue varchar(50) NOT NULL
);

INSERT INTO tbl_books_LOANS
(LOANS_BookID, LOANS_BranchID, LOANS_CardNo, LOANS_DateOut, LOANS_DateDue)
VALUES
	(1, 1, 1008, '10/18/2018', '11/18/2018'),
	(2, 2, 1009,'10/10/2018', '11/10/2018'),
	(7, 2, 1004, '10/18/2018', '11/19/2018'),
	(4, 3, 1000,'10/1202018', '11/18/2018'),
	(5, 4, 1007,'10/23/2018', '11/30/2018'),
	(6, 2, 1001,'09/18/2018', '11/08/2018'),
	(3, 1, 1004, '08/18/2018', '09/18/2018'),
	(8, 4, 1000, '10/11/2018', '11/11/2018'),
	(9, 3, 1003, '10/06/2018', '10/18/2018'),
	(10, 3, 1004, '03/18/2018', '09/18/2018'),
	(11, 1, 1005,'06/20/2018', '07/20/2018'),
	(12, 3, 1009, '10/06/2018', '11/06/2018'),
	(13, 2, 1008, '03/28/2018', '04/18/2018'),
	(14, 4, 1007, '04/18/2018', '05/18/2018'),
	(15, 1, 1004, '10/18/2018', '11/18/2018'),
	(16, 2, 1005,'06/18/2018', '09/18/2018'),
	(17, 4, 1007, '10/26/2018', '11/23/2018'),
	(18, 2, 1005, '10/30/2018', '11/124/2018'),
	(19, 4, 1004, '07/21/2018', '08/121/2018'),
	(20, 2, 1001,'09/28/2018', '11/28/2018')
;

/* 11/18/2018 is declared as TODAY for task 4 as the drill test BOOKSTORE*/

SELECT  tbl_books_COPIES.COPIES_Number_Of_Copies
	FROM tbl_books_COPIES
	INNER JOIN tbl_LIBRARY_BRANCH ON tbl_LIBRARY_BRANCH.LIBRARY_BranchID = tbl_books_COPIES.COPIES_BranchID
	INNER JOIN tbl_books ON tbl_books.BOOKS_BookId = tbl_books_COPIES.COPIES_BookID
	WHERE LIBRARY_BranchName='Sharpstown' AND BOOKS_Title='Lost Tribes'
	;

GO

EXEC [dbo].[getTask1]
GO

SELECT  tbl_books_COPIES.COPIES_Number_Of_Copies, tbl_LIBRARY_BRANCH.LIBRARY_BranchName
	FROM tbl_books_COPIES
	INNER JOIN tbl_LIBRARY_BRANCH ON tbl_LIBRARY_BRANCH.LIBRARY_BranchID = tbl_books_COPIES.COPIES_BranchID
	INNER JOIN tbl_books ON tbl_books.BOOKS_BookId = tbl_books_COPIES.COPIES_BookID
	WHERE BOOKS_Title='Lost Tribes'
	;
GO

EXEC [dbo].[getTask2]



SELECT  tbl_BORROWER.BORROWER_Name

	FROM tbl_BORROWER
	LEFT JOIN tbl_books_LOANS ON tbl_books_LOANS.LOANS_CardNo = tbl_BORROWER.BORROWER_CardNo_ID 
	WHERE LOANS_CardNo IS NULL
	; 

GO
	
USE db_bookstore
GO


EXEC [dbo].[getTask3]

SELECT tbl_books.BOOKS_Title, tbl_BORROWER.BORROWER_Name, tbl_BORROWER.BORROWER_Address, tbl_books_LOANS.LOANS_DateDue, tbl_LIBRARY_BRANCH.LIBRARY_BranchName 
	FROM tbl_BORROWER
	INNER JOIN tbl_books_LOANS ON tbl_BORROWER.BORROWER_CardNo_ID = tbl_books_LOANS.LOANS_CardNo
	INNER JOIN tbl_LIBRARY_BRANCH ON tbl_LIBRARY_BRANCH.LIBRARY_BranchID = tbl_books_LOANS.LOANS_BranchID
	INNER JOIN tbl_books ON tbl_books.BOOKS_BookId = tbl_books_LOANS.LOANS_BookID
	WHERE tbl_books_LOANS.LOANS_DateDue='11/18/2018' AND tbl_LIBRARY_BRANCH.LIBRARY_BranchName='Sharpstown'
	;
GO

EXECUTE [dbo].[getTask4]

USE db_bookstore

SELECT  tbl_LIBRARY_BRANCH.LIBRARY_BranchName, tbl_books_LOANS.LOANS_DateOut, tbl_books_COPIES.COPIES_Number_Of_Copies
	FROM tbl_books_LOANS
	INNER JOIN tbl_books_COPIES ON tbl_books_LOANS.LOANS_BookID = tbl_books_COPIES.COPIES_BookID
	INNER JOIN tbl_LIBRARY_BRANCH ON tbl_LIBRARY_BRANCH.LIBRARY_BranchID=tbl_books_LOANS.LOANS_BranchID
	;
GO

EXEC [dbo].[getTask5]

GO

SELECT tbl_BORROWER.BORROWER_Name, tbl_BORROWER.BORROWER_Address, tbl_books_LOANS.LOANS_DateOut, tbl_books_COPIES.COPIES_Number_Of_Copies
	FROM tbl_BORROWER
	INNER JOIN tbl_books_LOANS ON tbl_BORROWER.BORROWER_CardNo_ID = tbl_books_LOANS.LOANS_CardNo
	INNER JOIN tbl_books_COPIES ON tbl_books_COPIES.COPIES_BookID = tbl_books_LOANS.LOANS_BookID
	INNER JOIN tbl_books ON tbl_books.BOOKS_BookId = tbl_books_LOANS.LOANS_BookID
	WHERE tbl_books_COPIES.COPIES_Number_Of_Copies > 5
	;
GO

EXEC [dbo].[getTask6]
GO

SELECT tbl_books_COPIES.COPIES_Number_Of_Copies, tbl_books_Author.AUTHOR_AuthorName, tbl_books.BOOKS_Title
	FROM tbl_books
	INNER JOIN tbl_books_Author ON tbl_books.BOOKS_BookId = tbl_books_Author.AUTHOR_BookID
	INNER JOIN tbl_books_COPIES ON tbl_books_COPIES.COPIES_BookID = tbl_books.BOOKS_BookId 
	
	WHERE tbl_books_Author.AUTHOR_AuthorName='Stephen King'
	;
	GO

USE db_bookstore
EXECUTE [dbo].[getTask7]
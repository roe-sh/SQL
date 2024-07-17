create database Ayman_Jaradat_teach;
USE  Ayman_Jaradat_teach;

CREATE TABLE  Authors 
(
ID INT PRIMARY KEY IDENTITY (1,1) ,
AuthorName VARCHAR(40)
);
INSERT INTO Authors(AuthorName) VALUES 
      ('Various'),
	  ('Tayeb Salih'),
	  ('Alaa Al Aswany'),
	  ('Abdul Rahman Munifl'),
	  ('Ahdaf Soueif'),
	  ('Kahlil Gibran')


CREATE TABLE Books 
(
ID INT PRIMARY KEY IDENTITY (1,1),
Authors_ID int FOREIGN KEY REFERENCES Authors(ID),
BookName VARCHAR(40) UNIQUE
);  

INSERT INTO Books(Authors_ID, BookName) VALUES 
    (1, 'The Arabian Nights'),
    (2, 'Season of Migration to the North'),
    (3, 'The Yacoubian Building'),
    (4, 'Cities of Salt'),
    (5, 'The Map of Love'),
    (6, 'The Prophet'),
    (4, 'Men in the Sun'),
    (5, ' The Pessoptimist');

CREATE TABLE Categories 
(
    ID INT PRIMARY KEY IDENTITY (1,1),
    Books_ID INT FOREIGN KEY REFERENCES Books(ID),
    Category VARCHAR(40)
);

INSERT INTO Categories (Books_ID, Category) VALUES 
    (1, 'Classic Literature'),
    (2, 'Postcolonial Literature'),
    (3, 'Contemporary Literature'),
    (4, 'Political Fiction'),
    (5, 'Historical Romance'),
    (6, 'Philosophy');

	CREATE TABLE SectionsOfLibrary 
(
    ID INT PRIMARY KEY IDENTITY (1,1),
    Section VARCHAR(40),
	Books_ID INT FOREIGN KEY REFERENCES Books(ID),
);

INSERT INTO SectionsOfLibrary(Section,Books_ID) VALUES 
    ('Section A',1),
    ('Section B',2),
	('Section C',4),
	('Section D',5),
	('Section E',6),
	('Section F',3);

	CREATE TABLE Employees 
(
    ID INT PRIMARY KEY IDENTITY (1,1),
    Sections_ID INT FOREIGN KEY REFERENCES SectionsOfLibrary(ID),
    EmpName VARCHAR(40)
);
INSERT INTO Employees(Sections_ID, EmpName) VALUES 
    (1, 'John Doe'),
    (2, 'Jane Smith'),
    (3, 'Michael Brown'),
    (4, 'Linda White'),
	(1, 'Linda Brown'),
	(2, 'Linda Smith');

CREATE TABLE Users 
(
    ID INT PRIMARY KEY IDENTITY (1,1),
    UserName VARCHAR(40),
    Books_ID INT FOREIGN KEY REFERENCES Books(ID)
);

INSERT INTO Users(UserName, Books_ID) VALUES 
    ('RAHAF', 1),
    ('SURA', 2),
    ('HANEEN', 4),
    ('RAMA', 5),
	('OMAR', 6),
	('HAMZA', 5),
	('DEEMA', 2),
	('Julia', 1),
    ('ZAIN', 6);

SELECT Authors.AuthorName as 'Author Name' , Books.BookName as 'Book'
FROM Authors
FULL JOIN Books
ON Authors.ID = Books.Authors_ID;

SELECT Employees.EmpName as 'Employee Name' , SectionsOfLibrary.Section as 'Section'
FROM Employees
inner JOIN SectionsOfLibrary
ON Employees.Sections_ID = SectionsOfLibrary.ID;

SELECT Users.UserName as 'User Name' , Books.BookName as 'Book Name'
FROM Users
left JOIN Books
ON Users.Books_ID = Books.ID;

SELECT Books.Authors_ID as 'Author' ,Authors.AuthorName as 'Author Name',Books.BookName as 'Book' , Categories.Category as 'Category'
FROM Categories
inner JOIN Books ON Books.ID= Categories.Books_ID
inner JOIN Authors ON Authors.ID=Books.Authors_ID ;
 
 SELECT Books.BookName as 'Book Name', Users.UserName as 'User Name' 
FROM Users
right JOIN Books
ON Users.Books_ID = Books.ID;
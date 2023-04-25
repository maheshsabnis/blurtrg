-- creating database
CReate Database BlueCompany;
-- change the database context
use BlueCompany;
-- Creating table
-- DDL Statement
create table Department (
	DeptNo int primary Key,
	DeptName varchar(200),
	Location varchar(200)
);

-- ALtering TAble by adding a new column in it
-- Alter Table [TAble-Name] Add [COLUMNAME] [DATATYPE] 
alter table Department Add Capacity int;

-- Lets ALter Table by ALtering the Columns by defining Not Null check

Alter Table Department Alter Column DeptName varchar(200) Not Null;
Alter Table Department Alter Column Location varchar(200) Not Null;
Alter Table Department Alter Column Capacity int Not Null;

-- DML Query to INsert Data for Department
insert into Department Values(10, 'IT', 'Pune', 1000);
insert into Department Values(20, 'HR', 'Pune', 10);
insert into Department Values(30, 'AC', 'Pune', 120);
insert into Department Values(40, 'SL', 'Pune', 400);

Select * from Department;

-- Lets create Employee Table
-- References, used to create a table as a 
-- child of the other table by referencings it Primary Key
-- THis will Result into implemetation of "Referential Integrity" (?)
CReate Table Employee (
  EmpNo int Primary Key,
  EmpName varchar(300) Not Null,
  Designation varchar(100) Not Null,
  Salary int Not Null,
  DeptNo int References Department(DeptNo) Not Null
);

insert into EMployee values (101, 'Mahesh','Director',22222,10);
insert into EMployee values (102, 'Ajay','Manager',12222,20);
insert into EMployee values (103, 'Tejas','Lead',2422,30);
insert into EMployee values (104, 'Vikram','Director',52222,40);
insert into EMployee values (105, 'Suprotim','Manager',32222,10);
insert into EMployee values (106, 'Manish','Lead',12522,20);
insert into EMployee values (107, 'Saket','Lead',32222,30);
insert into EMployee values (108, 'Sachin','Director',62222,40);

-- CReate Table
Create Table Person(
  PersonId int ,
  PersonName varchar(200) Not null,
  Age int Not null

);
-- ALtering Table Form Primary Key

Alter Table Person Alter COlumn PersonId int Not Null;  

ALter Table Person
Add Constraint PK_Person PRIMARY KEY (PersonId);

Create Table [User] (
   UserId int Primary Key,
   Email varchar(300) not null,
   [Password] varchar(16) Not Null,
    PersonId int
);

-- ALtering Table for Adding Foreign Key

ALTER TABLE [User]
ADD CONSTRAINT FK_PersonId
FOREIGN KEY (PersonId) REFERENCES Person(PersonId);

-- Dropping the Column

Alter Table [User]
Drop Column [Password]

Alter Table [User]
Add  [Password] varchar(16) Not null;

-- Dropping Constraints
Alter Table [User]
Drop COnstraint FK_PersonId;

 -- Dropping Foreign Key Column
 -- If the COumn is FOreign Key then first Drop The Foreign Key COnstraint
 -- and then drop coumn
Alter Table [User]
Drop Column PersonId;












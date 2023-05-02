CREATE TABLE Countries
 
(CountryID INT PRIMARY KEY,
CountryName VARCHAR(50),
CountryCode VARCHAR(3))
 
 
CREATE TABLE States
 
(StateID INT PRIMARY KEY,
StateName VARCHAR(50),
StateCode VARCHAR(3),
CountryID INT)
 
 
 
ALTER TABLE [dbo].[States]  WITH CHECK ADD  CONSTRAINT [FK_States_Countries] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Countries] ([CountryID])
ON DELETE CASCADE
GO
 
ALTER TABLE [dbo].[States] CHECK CONSTRAINT [FK_States_Countries]
GO

INSERT INTO Countries VALUES (1,'United States','USA')
 
INSERT INTO Countries VALUES (2,'United Kingdom','UK')

INSERT INTO Countries VALUES (3,'India','IN')
 
INSERT INTO States VALUES (1,'Texas','TX',1)
INSERT INTO States VALUES (2,'Arizona','AZ',1)

 
INSERT INTO States VALUES (3,'Maharashtra','MH',3)
INSERT INTO States VALUES (4,'Telangana','TS',3)


Select * from States;

Delete from Countries where CountryID = 1;



Create table Parent
(
  ParentId int Primary Key,
  ParentName varchar(300) Not Null
)


Create table Child
(
	ChildId int Primary Key,
	ChildName varchaR(300) Not Null,
	PerentId int References Parent(ParentId) On Delete Cascade
)


Delete from Parent Where ParentId = 1;

Select * from Child;



CReate Table MyDept
(
   DeptNo int Primary Key,
   DeptName varchar(100) Not Null,
   Location varchar(100) Not null
);

Alter Table MyDept
Add Constraint DeptName_Unique Unique(DeptName);

Drop Table MyDept;

insert into MyDept values(20, 'IT', 'Pune')
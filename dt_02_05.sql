-- Using COnstraints for Table Colunms to prevent invaud data while writing values
-- as well as setting default values for columns to be prevent un-necessary inserts

-- Check, a rule that will restrict the value for Age column less that 35
-- GetDate(), a SQL Server STadard Function, that will read System Data

Create table Student(
  StudentId int Primary Key,
  StudentName varchar(300) Not null,
  Age int Check (Age  < 35),
  AdmitDate Date default GetDate() Not null
);


insert into Student (StudentId, StudentName, Age)  values(1, 'ABC', 30);


insert into Student (StudentId, StudentName, Age) values(3, 'PQR', 60); 

Select * from Student;

Drop Table Student;

-- No default
-- Identity Column value will be generated  from 1 by default
create table DemoTab(
  id int identity,
  name varchar(10) not null
);
 -- The following insert statement will generate error
--insert into DemoTab (id,name) values(1, 'A');
-- SUccess
insert into DemoTab  values('C');

Select * from DemoTab;

-- Delete all Records from DemoTab
Delete From DemoTab where id = 4;

-- Delete all record from table and reset the value for identity column 'id'
truncate table DemoTab;


Drop TAble DemoTab;



-- Identity Column value will be generated  from 1 by default with increment the value for
-- identity, the id will start from 1 and next value for id in next record will be
-- increment by 9
create table DemoTab(
  id int identity(1,9),
  name varchar(10) not null
);
insert into DemoTab  values ('B');
Select * from DemoTab;

-- USing the UNique
--  A Powerful COnstratint like Primary key but it is mostly applied on 
-- the imeediate dependant key of Primary key to prevent data repetation

create table CompanyMaster(
  CompanyId int Primary Key,
  CompanyName varchar(200) UNique Not null 
);


insert into CompanyMaster Values(1002,  'Mahesh IT');


-- Lest have Union of Records from Department to Employee

Select DeptNo,DeptName, Location from Department
Union
Select EmpNo, EmpName, Designation from Employee;


Select Max(Salary) as Salary from EMployee;

Declare @Income int;
Set @Income = 2300.89;
-- Casting a type only for the current expression
select cast(@Income as int);
-- Type COnversion as Permanant
Select Convert(int,@Income)

Select Abs(@Income)























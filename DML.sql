-- INsert

insert into Department Values(60, 'Admin', 'Mumbai', 100); 
-- Defining Parameters
declare @DeptNo int;
Set @DeptNo = 70;
declare @DeptName varchar(200);
Set @DeptName = 'Training';
declare @Location varchar(200);
Set @Location = 'Pune';
declare @Capacity int;
Set @Capacity = 900;

Insert into Department(DeptNo, DeptName, Location, Capacity) 
values
(@DeptNo,@DeptName,@Location,@Capacity);


Select * from Employee where DeptNo=10;

Update Employee Set Salary = Salary + 10000
where DeptNo = 10 and Designation = 'Director';

select * from Department;

Delete From Department where DeptNo=70;

Delete from Employee
where DeptNo in (40,50);

select * from Department;
Select * from Employee;









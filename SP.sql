-- Creating Procedure
CReate Procedure sp_getEmployees
As
Begin
 select * from Employee;
End
go

-- Executing Procedure
execute sp_getEmployees;
go
-- Procedure with input Parameter
-- The DEfault for Parameter is Input
create procedure sp_getEmployeesByDeptNo
@DeptNo int 
As
Begin
	select * from Employee
	where
	DeptNo=@DeptNo;
End
go

-- Exeecuting a SP using the input parameter
Declare @DeptNo int;
Set @DeptNo=20;
Exec sp_getEmployeesByDeptNo @DeptNo;
go
-- Proc that is returning value (No Out parameter)

create proc sp_getSumSalaryByDeptNo
@DeptNo int
As
Begin
	-- Declare a local variable
	Declare @SumSalary int;

	Select @SumSalary = sum(Salary) from Employee where DeptNo=@DeptNo;

	-- return
	return @SumSalary;
End
go
-- Declaring input parameter and return value
Declare @DeptNo int;
Set @DeptNo=20;
Declare @SumSalary int
-- Execute the SP and Get the Return value
Exec @SumSalary =  sp_getSumSalaryByDeptNo @DeptNo;
-- Print the Return Statement
Select @SumSalary;

Go;


-- USing Output parameter
create proc sp_getSumSalaryByDeptNoWithOut
@DeptNo int,
@SumSalary int Output
As
Begin
	Select @SumSalary = sum(Salary) from Employee where DeptNo=@DeptNo;
End
go
-- Executig SP with output parameter

Declare @DeptNo int;
Set @DeptNo=20;
Declare @SumSalary int

Exec sp_getSumSalaryByDeptNoWithOut @DeptNo, @SumSalary output;
Select @SumSalary as OutSalary;
Go

-- SP with COnditional STatement

create proc sp_getSumSalaryByDeptoIf
@DeptNo int,
@SumSalary int Output
As
Begin
    If @DeptNo > 0
	 Begin
		Select @SumSalary = sum(Salary) from Employee where DeptNo=@DeptNo;
	 End;
    Else
	 Set @SumSalary = 0;
	
End
go

Declare @DeptNo int;
Set @DeptNo=0;
Declare @SumSalary int

Exec sp_getSumSalaryByDeptNoWithOut @DeptNo, @SumSalary output;
Select @SumSalary as OutSalary;
Go

Declare @x int
Set @x = 10;
Select IIF(@x>0,'true','false');

























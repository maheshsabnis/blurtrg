-- The Transaction Magmt
-- If multiple tabls are affected on a single request and if 
-- Some Tables are succesfull with Commands but ony one table command
-- is failed, then to manage the data update consistency**
-- all DML statements MUST be bundled into a signle TRansaction
-- 1. Find out all tables those will be affcted based on a Procedure call
-- 2. Make sure that before the FIrst DML statement is called, the trasaction 
-- must be initilized (aka defining the Transaction MOnitor over an active connection)

Create or alter Proc sp_MultiTableInsert
  @DeptNo int, @DeptName varchar(100), @Location varchar(100), @Capacity int,
  @EmpNo int, @EmpName varchar(200), @Designation varchar(200), @Salary int
As
Begin
	Begin Tran -- Initializing the TX Monitor
	  Begin Try	
		-- Insert Dept
		Insert into Department (DeptNo, DeptName, Location,Capacity)
		Values
		(@DeptNo, @DeptName, @Location, @Capacity);
		-- Insert Emp
		Insert into Employee (EmpNo, EmpName, Designation, Salary,DeptNo)
		Values
		(@EmpNo, @EmpName, @Designation, @Salary, @DeptNo);
		 -- If No Error Commit Transaction
		 COMMIT Transaction -- Will execute /  process all statements
	  End Try
	  Begin Catch
		-- Rollback Changes if Error Occurres
		ROLLBACK Transaction -- Cancel all Statements
	  End Catch	
End
Go


-- Lets Execute

declare @DeptNo int;
Set @DeptNo=80
Declare @DeptName varchar(200)
Set @DeptName = 'Admin-Maintenence'
Declare @Location varchar(200)
Set @Location = 'Mumbai-East'
Declare @Capacity int
Set @Capacity =400
Declare @EmpNo int
Set @EmpNo = 700;
DEclare @EmpName varchar(200)
Set @EmpName = 'Daniel';
Declare @Designation Varchar(200)
Set @Designation = 'Manager'
Declare @Salary int 
Set @Salary = 80000

Exec sp_MultiTableInsert @DeptNo, @DeptName, @Location, @Capacity, @EmpNo, @EmpName, @Designation, @Salary
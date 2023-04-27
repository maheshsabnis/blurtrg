create proc sp_InsertDepartment
 @DeptNo int,
 @DeptName varchar(200),
 @Location varchar(200),
 @Capacity varchar(200)
As
Begin
	Declare @StatusMessage varchar(400);
	Insert into Department
	(DeptNo, DeptName,Location, Capacity)
	Values
	(@DeptNo, @DeptName,@Location,@Capacity);
End
go

Declare @DeptNo int;
Set @DeptNo=140;
Declare @DeptName varchar(200);
Set @DeptName = 'IT-Support-Maintenence';
Declare @Location varchar(200);
Set @Location = 'Pune';
Declare @Capacity int;
Set @Capacity = 300;

Exec sp_InsertDepartment @DeptNo,@DeptName,@Location,@Capacity;
go

select * from Department;
go

-- SP with Error Handling
create proc sp_InsertDepartmentWithErrorHandling
 @DeptNo int,
 @DeptName varchar(200),
 @Location varchar(200),
 @Capacity varchar(200)
As
Begin
    Begin Try
		Declare @StatusMessage varchar(400);
		
		Insert into Department
		(DeptNo, DeptName,Location, Capacity)
		Values
		(@DeptNo, @DeptName,@Location,@Capacity);

	    Set @StatusMessage = 'Record inserted sucecssfully';

		Select @StatusMessage;

	End try
	Begin Catch
	  -- Print Error Message
	  -- Standard Functions from Master Database
	  Select ERROR_NUMBER() as ErrorNumber,
	         ERROR_SEVERITY() as ErrorSeverity,
			 ERROR_MESSAGE() as ErrorMessage
	End Catch
End
go

Declare @DeptNo int;
Set @DeptNo=50;
Declare @DeptName varchar(200);
Set @DeptName = 'HR-Salary-Processing';
Declare @Location varchar(200);
Set @Location = 'Pune';
Declare @Capacity int;
Set @Capacity = 440;
Exec sp_InsertDepartmentWithErrorHandling @DeptNo,@DeptName,@Location,@Capacity;
go
-- SP with Status of Execution as Output parameter

create proc sp_InsertDepartmentWithErrorHandlingOutput
 @DeptNo int,
 @DeptName varchar(200),
 @Location varchar(200),
 @Capacity varchar(200),
 @StatusMessage nchar(4000) output
As
Begin
    Begin Try
		 
		
		Insert into Department
		(DeptNo, DeptName,Location, Capacity)
		Values
		(@DeptNo, @DeptName,@Location,@Capacity);

	    Set @StatusMessage = 'Record inserted sucecssfully';

		 

	End try
	Begin Catch
	  -- Print Error Message
	  -- Standard Functions from Master Database
	  --Select ERROR_NUMBER() as ErrorNumber,
	  --       ERROR_SEVERITY() as ErrorSeverity,
			-- ERROR_MESSAGE() as ErrorMessage
	     
		Set @StatusMessage =  ERROR_MESSAGE();
	End Catch
End
go


Declare @DeptNo int;
Set @DeptNo=50;
Declare @DeptName varchar(200);
Set @DeptName = 'HR-Salary-Processing';
Declare @Location varchar(200);
Set @Location = 'Pune';
Declare @Capacity int;
Set @Capacity = 440;
Declare @StatusMessage nchar(4000);

Exec sp_InsertDepartmentWithErrorHandlingOutput @DeptNo,@DeptName,@Location,@Capacity,@StatusMessage output;

Select @StatusMessage;
go


-- USing Throw and Raise Error
-- USe try..catch block to Raise Error
ALter proc sp_ThrowDemo
 @DeptNo int
As
Begin
	if(@DeptNo < 0)
	 -- Throw 1, 'DeptNO cannot be -ve'
	 RAISERROR ('DeptNO Cannot be -ve', -- Message text.
               16, -- Severity.
               1 -- State.
               );
End
go

Declare @DeptNo int
Set @DeptNo = -90;
Exec sp_ThrowDemo @DeptNo;
go

ALter proc sp_ThrowTryDemo
 @DeptNo int
As
Begin
    Begin try 

	if(@DeptNo < 0)
		-- Number, Message, Severity 
	  Throw 50000, 'DeptNO cannot be -ve', 16
	end try
	begin catch
		print Error_Number() -- Error Number 
		print Error_Message() -- MEssage
		print Error_Severity() -- Severity
	end catch

End
go


Declare @DeptNo int
Set @DeptNo = -90;
Exec sp_ThrowTryDemo @DeptNo;
go















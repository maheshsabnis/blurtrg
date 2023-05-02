-- Using Triggers

Create table EmployeeAudit(
  AuditId int identity (1,1) Primary Key,
  AuditEmpNo int not null,
  AudiDate Date default GetDate() Not null
)
go

-- Triggres,
-- Action based Block that is executed when a table is
-- INserted, Updated, or Deleted with record(s)
-- Advantage: This helps to create an Audit Table and an Audit ENtry for 
-- any business table (target table) that is updated (Insert,Udate,and Delete)
-- THis prevents the frequent Insert STatement execution in Audit table
-- for any updates in Busiess table
Create Trigger trg_InsertEmp 
On Employee -- The Target Table
After Insert -- an action that causes the Trigger to execute
As
Begin
  Declare @EmpNo Int;
  -- Read the EmpNo of the latest inserted record in EMployee table
  -- Inserted: Represent the newly inserted record
  Select @EmpNo = EmpNo from Inserted
  -- MAke a new ENtry in EMployee Audit Table
  Insert into EmployeeAudit 
  Values
  (
	@EmpNo,
    GETDATE() 
  )
   	
End;
select * from Employee;
Insert into Employee Values (203, 'Sachin', 'Manager', 34000, 20);
 
Select * from EmployeeAudit;
go;

Create Trigger trg_DeleteEmp 
On Employee
After Delete
As
Begin
  Declare @EmpNo Int;
  Select @EmpNo = EmpNo from deleted
  Insert into EmployeeAudit 
  Values
  (
	@EmpNo,
    GETDATE() 
  )
   	
End;

go;

Delete From Employee Where EmpNo=203;

Select * from Employee;
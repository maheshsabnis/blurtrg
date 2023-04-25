-- Reports
-- Statements aka COmmands
-- Select Statement
	--  Reports
-- Data Manipulation Language (DML), Insert, Update, and Delete

-- Get all Records of Employees

Select * from Employee;

-- Clause

Select EmpNo, EMpName from Employee where Designation = 'Manager';

-- Employees with EmpNae STarts from 'A'
-- use of 'Like' and Expression as '%'

Select EMpNo, EmpNAme, DeptNo, DEsignation, Salary
from Employee
where EmpNAme Like 'A%'
-- EMployees only in specific DeptNo
 Select EMpNo, EmpNAme, DeptNo, DEsignation, Salary
from Employee
where DeptNo In (10,20,30)

-- Calculated Dynamically Generated COlumn
 Select EMpNo, EmpNAme, DeptNo, DEsignation, Salary, Tax=0.2*Salary
from Employee

-- Using Multiple Table Ordering in Ascending Order
Select EmpNo, EmpName,DEsignation, DeptName, Location
From Employee, Department
where Employee.DeptNo = Department.DeptNo
Order by EmpName DEsc

-- Use of Scalar functions based on Groups

select DeptNo, Sum(Salary) as Salary From Employee
group by DeptNo;
-- With Errors
select Employee.DeptNo, DeptName, Sum(Salary) as Salary From Employee, Department
group by Department.DeptNo;
Where Employee.DeptNo = Department.DeptNo















Select DeptNo, DeptName,Location from Department
Union
Select EmpNo,EmpName, Designation from Employee

select * from Employee where DeptNo=10;

Select Count(EmpNo), DeptNo from Employee
Group by DeptNo
Having COUNT(EmpNo) >= 4
Select * from Department,Employee;

-- Joins
-- Inner, Left, and Right
-- Result based on Matche
Select * from Department,EMployee
where Department.DeptNo = Employee.DeptNo;

-- USe of Joins
-- From Left (Department) to Right (Employee)
Select * from Department
Left Join Employee
on Department.DeptNo=  Employee.DeptNo 
-- Left(EMployee) and Right(Department)
Select * from Employee
Left Join Department
on Department.DeptNo=  Employee.DeptNo 



-- Right Jpin
-- From Right (Employee) to Left (Department)
Select * from Department
Right Join Employee
on Department.DeptNo=  Employee.DeptNo 









CReate Table MyTable(
  Id int Primary Key,
  Name varchar(400) Not Null,
  Age int Check (Age > 20),
  RegisterDate datetime default GetDate()
);

insert into MyTable (Id, NAme, Age) Values(1, 'Mahesh',47);

Select * from MyTable;

Drop Table MyTable;



Select GetDate();
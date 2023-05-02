use BlueCompany

CReate Table MyParent(
 ParentId int Primary Key,
 ParentName varchar(400) Not Null

);

insert into MyParent Values (1, 'P1');
insert into MyParent Values (2, 'P1');
insert into MyParent Values (3, 'P1');
 -- Delete ALl CHilden whrn the Parent is deleted
Create Table MyChild (
  ChildId int Primary Key,
  ChildName varchar(100) Not Null,
  ParentId int References MyParent(ParentId) on Delete Cascade
);

insert into MyChild Values(11, 'C1',1);
insert into MyChild Values(12, 'C2',2);
insert into MyChild Values(13, 'C3',3);
insert into MyChild Values(14, 'C4',1);
insert into MyChild Values(15, 'C5',2);
insert into MyChild Values(16, 'C6',3);

Select * from MyParent;
Select * from MyChild;
Delete From MyParent where ParentId=3
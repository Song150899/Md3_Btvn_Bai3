create database QuanLySinhVien;
create table QuanLySinhVien.Students(
StudentID int(4) primary key,
StudentName varchar(50),
Age int(4),
Email varchar(100)
);

create table Subject(
SubjectID int(4) primary key,
SubjectName varchar(50)
);

create table Marks(
Mark int,
SubjectID int ,
StudentID int,
foreign key (SubjectID) references Subject(SubjectID),
foreign key(StudentID) references Students(StudentID)
);

create table Classses(
ClassID int(4) primary key,
ClassName varchar(50)
); 

create table ClassStudent(
StudentID int,
foreign key(StudentID) references Students(StudentID),
ClassID int(4),
foreign key (ClassID) references Classses(ClassID) 
);

insert into Students values(1,'Song', 18,'songkl4499@gmail.com');
insert into students values(2,'Say',19,'song1805@gmail.com');
insert into Students values(3,'dạt', 21,'aaaa');
insert into Students values(4,'Blue', 25,'blue99.vn');
insert into Students values(5,'52hz', 30,'kkkk');

insert into classses values(1,'co322g1');
insert into classses values(2,'c0422g1');

insert into classstudent values(1,1);
insert into classstudent values(2,1);
insert into classstudent values(3,2);
insert into classstudent values(4,2);
insert into classstudent values(5,2);

insert into Marks values(8,1,1);
insert into Marks values(4,2,1);
insert into Marks values(9,1,1);
insert into Marks values(7,1,3);
insert into Marks values(3,1,4);
insert into Marks values(5,2,5);
insert into Marks values(8,3,3);
insert into Marks values(1,3,5);
insert into Marks values(3,2,4);

insert into Subjects values(1,'SQL');
insert into Subjects values(2,'JAVA');
insert into Subjects values(3,'C');
insert into Subjects values(4,'Visual Basic');

select * from Students;
-- Hiển thị tất cả học viên

select * from Subjects;
-- Hiển thị tất cả các lớp học

Select agv(Mark) as diemTB from marks;
-- Câu 3

Select SubjectName from Subject where SubjectID=(Select SubjectID from Marks where Mark=(Select Max(mark) from marks));
-- câu 4

select mark,count(mark) from marks group by marks;
select stt,mark from marks order by mark desc;
-- câu 5

alter table subject change column `SubjectName` `SubjectName` nvarchar(255);
-- câu 6

update  subject set `SubjectName`=concat('<<Day la mon hoc', (select SubjectName from subject));
-- câu 7

alter table students add check (age>15 and age<50);
-- câu 8

delete from Students where studentID=1;
-- câu 10

alter table Students add column `status` bit default 1;
-- câu 11

update students set status=0 where studentID>0;
-- câu 12
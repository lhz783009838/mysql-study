#��ѧ����Ϣ��student
create table student
(
sno varchar(20) not null primary key,
sname varchar(20) not null,
ssex varchar(20) not null,
sbirthday datetime,
class varchar(20)

);
#������ʦ��
create table teacher
(
tno varchar(20) not null primary key,
tname varchar(20) not null,
tsex varchar(20) not null,
tbirthday datetime,
prof varchar(20),
depart varchar(20) not null

);
#�����γ̱�course
create table course
(
cno varchar(20) not null primary key,
cname varchar(20) not null,
tno varchar(20) not null,
foreign key(tno) references teacher(tno)

);
#�����ɼ���
create table score
(
sno varchar(20) not null primary key,
foreign key(sno) references student(sno),
cno varchar(20) not null,
foreign key(cno) references course(cno),
degree decimal

);

#���ѧ����Ϣ
insert into student values('108','����','��','1977-09-01','95033');
insert into student values('105','����','��','1975-10-02','95031');
insert into student values('107','����','Ů','1976-01-23','95033');
insert into student values('101','���','��','1976-02-20','95033');
insert into student values('109','����','Ů','1975-02-10','95031');
insert into student values('103','½��','��','1974-06-03','95031');




#��ӽ�ʦ��
insert into teacher values('804','���','��','1958-12-02','������','�����ϵ');
insert into teacher values('856','����','��','1969-03-12','��ʦ','���ӹ���ϵ');
insert into teacher values('825','��Ƽ','Ů','1972-05-05','����','�����ϵ');
insert into teacher values('831','����','Ů','1977-08-14','����','���ӹ���ϵ');

#��ӿγ̱�
insert into course values('3-105','���������','825');
insert into course values('3-245','����ϵͳ','804');
insert into course values('6-166','���ֵ�·','856');
insert into course values('9-888','�ߵ���ѧ','831');
#��ӳɼ���

insert into score values('103','3-245','86');
insert into score values('105','3-245','75');
insert into score values('109','3-245','68');
insert into score values('103','3-105','92');
insert into score values('105','3-105','88');
insert into score values('109','3-105','76');
insert into score values('103','3-105','64');
insert into score values('105','3-105','91');
insert into score values('109','3-105','78');
insert into score values('103','6-166','85');
insert into score values('105','6-166','79');
insert into score values('109','6-166','81');
 

 

 

1�� ��ѯStudent���е����м�¼��Sname��Ssex��Class�С�

1
select Sname,Ssex,Class from student
2�� ��ѯ��ʦ���еĵ�λ�����ظ���Depart�С�

1
select distinct Depart from teacher
3�� ��ѯStudent������м�¼��

1
select *  from student
4�� ��ѯScore���гɼ���60��80֮������м�¼��

1
select *  from Score where Degree between 60 and 80
5�� ��ѯScore���гɼ�Ϊ85��86��88�ļ�¼��

1
select *  from Score where Degree in(85,86,88)
6�� ��ѯStudent���С�95031������Ա�Ϊ��Ů����ͬѧ��¼��

1
select *  from Student where class='95031' or Ssex='Ů'
7�� ��Class�����ѯStudent������м�¼��

1
select *  from student order by class desc
8�� ��Cno����Degree�����ѯScore������м�¼��

1
select *  from Score order by cno asc,degree desc
9�� ��ѯ��95031�����ѧ��������

1
select count(*)  from student where class='95031'
10��     ��ѯScore���е���߷ֵ�ѧ��ѧ�źͿγ̺š����Ӳ�ѯ��������

1
select Sno,Cno  from Score where Degree=(select max(Degree) from Score)
1
select Sno,Cno  from Score order by  Degree desc limit 0,1
11��     ��ѯÿ�ſε�ƽ���ɼ���

1
select Cno,avg(degree) from Score group by Cno
12��     ��ѯScore����������5��ѧ��ѡ�޵Ĳ���3��ͷ�Ŀγ̵�ƽ��������

1
select avg(Degree) from score where Cno like '3%' and Cno in (select Cno from score group by Cno having count(*)>=5) ��in ����= ����Ϊ���ܻ��ж��
1
��д����select avg(Degree) from score where Cno like '3%' and group by Cno having count(*)>=5
13��     ��ѯ��������70��С��90��Sno�С�

1
select Sno from Score where degree>70 and degree<90
14��     ��ѯ����ѧ����Sname��Cno��Degree�С�

1
select  Sname, Cno,Degree from Score , student where Score.Sno=student.Sno
15��     ��ѯ����ѧ����Sno��Cname��Degree�С�

1
select  Sno,Cname,Degree from Score , Course where Score.Cno=Course.Cno
16��     ��ѯ����ѧ����Sname��Cname��Degree�С�

1
select Sname,Cname,Degree from student,course,score where student.Sno=score.Sno and course.Cno=score.Cno
1
join .. on д����select Sname,Cname,Degree from student join score on student.Sno=score.Sno join course on course.Cno=score.Cno
17��     ��ѯ��95033����ѧ����ƽ���֡�

1
select avg(degree) as 'class=95033' from Score where Sno in (select Sno from  Student where Class='95033' ) ��
18�� ����ʹ�������������һ��grade��

create table grade(low  int(3),upp  int(3),rank  char(1))

insert into grade values(90,100,��A��)

insert into grade values(80,89,��B��)

insert into grade values(70,79,��C��)

insert into grade values(60,69,��D��)

insert into grade values(0,59,��E��)

�ֲ�ѯ����ͬѧ��Sno��Cno��rank�С�

1
select Sno,Cno,rank from Score,grade where degree between low and upp
19����ѯѡ�ޡ�3-105���γ̵ĳɼ����ڡ�109����ͬѧ�ɼ�������ͬѧ�ļ�¼��

1
<span style="color: #000000; font-size: 15px">109ͬѧ��ѡ����3-105�ε�</span>
1
select * from score where Cno='3-105' and degree>(select max(degree ) from Score where Sno='109' and Cno='3-105' )
1
<span style="font-size: 15px">109ͬѧ��û��ѡ��3-105��</span>
1
select * from score where Cno='3-105' and degree>(select max(degree ) from Score where Sno='109')
and degree<( select max(degree ) from Score where sno in (select Sno from score group by Sno having count(*)>1))

1
ѡ�˶��ſγ̲���������γ��²�����߷ֵ�
1
select * from score a where Sno in (select Sno from score group by Sno having count(*)>1) and degree<( select max(degree ) from Score b where b.cno = a.cno)
21����ѯ�ɼ�����ѧ��Ϊ��109�����γ̺�Ϊ��3-105���ĳɼ������м�¼��

1
Select * from score where degree>(select degree from Score where Sno='109' and Cno='3-105' )
22����ѯ��ѧ��Ϊ108��101��ͬѧͬ�����������ѧ����Sno��Sname��Sbirthday�С�

1
select sno,sname,sbirthday  from student where year(sbirthday) = (select year(sbirthday) from student where  sno='108')
1
select sno,sname,sbirthday  from student where year(sbirthday) = (select year(sbirthday) from student where  sno='101')
23����ѯ�����񡰽�ʦ�οε�ѧ���ɼ���

1
select Sno,degree from score,Course  where score.Cno=Course.Cno and Course.Tno= (select Tno from Teacher where Tname='����' )
1
select degree from score where Cno in (select cno from course where Tno= (select Tno from Teacher where Tname='����'  ) )
24����ѯѡ��ĳ�γ̵�ͬѧ��������5�˵Ľ�ʦ������

1
select Tname from Teacher,  Course where Teacher.Tno=Course.Tno and Course.Cno =(select Cno from Score group by Cno having count(*)>5)
1
select Tname from Teacher where tno=( select Tno from Course where cno=( select Cno from Score group by Cno having count(*)>5 ))
25����ѯ95033���95031��ȫ��ѧ���ļ�¼��

1
select * from  student where  class in ('95033','95031')
26��  ��ѯ������85�����ϳɼ��Ŀγ�Cno.

1
select Cno from score where degree>85
27����ѯ���������ϵ����ʦ���̿γ̵ĳɼ���

1
select * from course  where cno in (select cno from course  where tno in (select tno from teacher where Depart='�����ϵ'))
28����ѯ������ ��ϵ���롰���ӹ���ϵ����ְͬ�ƵĽ�ʦ��Tname��Prof��

1
select Tname,Prof from Teacher where Depart ='�����ϵ' and Prof  not in( select Prof from Teacher where Depart ='���ӹ���ϵ')<br>union <br>select Tname,Prof from Teacher where Depart ='���ӹ���ϵ' and Prof  not in( select Prof from Teacher where Depart ='�����ϵ')
29����ѯѡ�ޱ��Ϊ��3-105���γ��ҳɼ����ٸ���ѡ�ޱ��Ϊ��3-245����ͬѧ��Cno��Sno��Degree,����Degree�Ӹߵ��ʹ�������

any:��������������һ���ɼ��Ϳ���

1
select Cno,Sno,Degree from score where cno='3-105' and degree >any(select degree from score where cno='3-245' ) order by degree  desc
30����ѯѡ�ޱ��Ϊ��3-105���ҳɼ�����ѡ�ޱ��Ϊ��3-245���γ̵�ͬѧ��Cno��Sno��Degree.

all:���������е����гɼ�

1
select Cno,Sno,Degree from score where cno='3-105' and degree >all(select degree from score where cno='3-245' ) order by degree desc
31�� ��ѯ���н�ʦ��ͬѧ��name��sex��birthday.

1
select tname,tsex,tbirthday from Teacher union select sname,ssex,sbirthday from Student
32����ѯ���С�Ů����ʦ�͡�Ů��ͬѧ��name��sex��birthday.

1
select Tname,Tsex,Tbirthday from Teacher where Tsex='Ů' union select Sname,Ssex,Sbirthday from Student where Ssex='Ů'
33�� ��ѯ�ɼ��ȸÿγ�ƽ���ɼ��͵�ͬѧ�ĳɼ���

1
select * from score a  where degree < (select avg(degree) from score b where b.cno=a.cno)
34�� ��ѯ�����ον�ʦ��Tname��Depart.

1
select Tname,Depart from Teacher where tno in (select tno from course )
35 �� ��ѯ����δ���εĽ�ʦ��Tname��Depart.

1
select Tname,Depart from Teacher where Tno not in (select Tno from Course where cno in (select cno from score  ))
36����ѯ������2�������İ�š�

1
select class from student where ssex='��' group by class having count(*)>1
37����ѯStudent���в��ա�������ͬѧ��¼��

1
select * from Student where Sname not  like '��%%'
38����ѯStudent����ÿ��ѧ�������������䡣

1
select Sname, year(now())-year(sbirthday)  from Student
39����ѯStudent����������С��Sbirthday����ֵ��

1
select Max(Sbirthday ),Min(Sbirthday ) from Student
40���԰�ź�����Ӵ�С��˳���ѯStudent���е�ȫ����¼��

1
select * from Student  order by  class desc, Sbirthday
41����ѯ���С���ʦ�������ϵĿγ̡�

1
select Tname,Cname from course,teacher where course.tno= teacher.tno and teacher.Tsex='��'
42����ѯ��߷�ͬѧ��Sno��Cno��Degree�С�

1
select Sno,Cno,Degree from score where degree=(select max(degree) from score)
����д����

1
select Sno,Cno,Degree from score order by degree desc limit 0,1
43����ѯ�͡������ͬ�Ա������ͬѧ��Sname.

1
select Sname from Student where Ssex = (select Ssex from Student where Sname='���')
44����ѯ�͡������ͬ�Ա�ͬ���ͬѧSname.

1
select Sname from Student where Ssex = (select Ssex from Student where Sname='���' ) and class=( select class from student where Sname='���')
45����ѯ����ѡ�ޡ���������ۡ��γ̵ġ��С�ͬѧ�ĳɼ���

1
select  Sno,Cno,degree from score where Cno=( select Cno from course where Cname='���������') and Sno in (select Sno from student where Ssex='��')


���䣺����

��������д���������е���ʾ�����ݲ�����

#��ӳɼ���
insert into score values('103','3-245','86');
insert into score values('105','3-245','75');
insert into score values('109','3-245','68');
insert into score values('103','3-105','92');
insert into score values('105','3-105','88');
insert into score values('109','3-105','76');
insert into score values('103','3-105','64');
insert into score values('105','3-105','91');
insert into score values('109','3-105','78');
insert into score values('103','6-166','85');
insert into score values('105','6-166','79');
insert into score values('109','6-166','81');

�� ¥�� �����ɼ���ʱ����
#�����ɼ���
create table score
(
sno varchar(20) not null primary key,
foreign key(sno) references student(sno),
cno varchar(20) not null,
foreign key(cno) references course(cno),
degree decimal

);
����snoΪ������ ����insert���ܼ���ȫ��
degree decimalû�����÷�Χ(4,1)
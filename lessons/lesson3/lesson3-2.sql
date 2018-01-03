1、自行创建测试数据

2、查询“生物”课程比“物理”课程成绩高的所有学生的学号；

3、查询平均成绩大于60分的同学的学号和平均成绩； 

4、查询所有同学的学号、姓名、选课数、总成绩；

5、查询姓“李”的老师的个数；

6、查询没学过“叶平”老师课的同学的学号、姓名；

7、查询学过“001”并且也学过编号“002”课程的同学的学号、姓名；

8、查询学过“叶平”老师所教的所有课的同学的学号、姓名；

9、查询课程编号“002”的成绩比课程编号“001”课程低的所有同学的学号、姓名；

10、查询有课程成绩小于60分的同学的学号、姓名；

11、查询没有学全所有课的同学的学号、姓名；

12、查询至少有一门课与学号为“001”的同学所学相同的同学的学号和姓名；

13、查询至少学过学号为“001”同学所选课程中任意一门课的其他同学学号和姓名；

14、查询和“002”号的同学学习的课程完全相同的其他同学学号和姓名；

15、删除学习“叶平”老师课的SC表记录；

16、向SC表中插入一些记录，这些记录要求符合以下条件：①没有上过编号“002”课程的同学学号；②插入“002”号课程的平均成绩； 

17、按平均成绩从低到高显示所有学生的“语文”、“数学”、“英语”三门的课程成绩，按如下形式显示： 学生ID,语文,数学,英语,有效课程数,有效平均分；

18、查询各科成绩最高和最低的分：以如下形式显示：课程ID，最高分，最低分；

19、按各科平均成绩从低到高和及格率的百分数从高到低顺序；

20、课程平均分从高到低显示（现实任课老师）；

21、查询各科成绩前三名的记录:(不考虑成绩并列情况) 

22、查询每门课程被选修的学生数；

23、查询出只选修了一门课程的全部学生的学号和姓名；

24、查询男生、女生的人数；

25、查询姓“张”的学生名单；

26、查询同名同姓学生名单，并统计同名人数；

27、查询每门课程的平均成绩，结果按平均成绩升序排列，平均成绩相同时，按课程号降序排列；

28、查询平均成绩大于85的所有学生的学号、姓名和平均成绩；

29、查询课程名称为“数学”，且分数低于60的学生姓名和分数；

30、查询课程编号为003且课程成绩在80分以上的学生的学号和姓名； 

31、求选了课程的学生人数

32、查询选修“杨艳”老师所授课程的学生中，成绩最高的学生姓名及其成绩；

33、查询各个课程及相应的选修人数；

34、查询不同课程但成绩相同的学生的学号、课程号、学生成绩；

35、查询每门课程成绩最好的前两名；

36、检索至少选修两门课程的学生学号；

37、查询全部学生都选修的课程的课程号和课程名；

38、查询没学过“叶平”老师讲授的任一门课程的学生姓名；

39、查询两门以上不及格课程的同学的学号及其平均成绩；

40、检索“004”课程分数小于60，按分数降序排列的同学学号；

41、删除“002”同学的“001”课程的成绩；































1、自行创建测试数据
2、查询“生物”课程比“物理”课程成绩高的所有学生的学号；
select A.student_id,sw,ty from (select student_id,number as sw from score left join course on score.corse_id = course.cid where course.cname = '生物') as A left join (select student_id,number as ty from score left join course on score.corse_id = course.cid where course.cname = '体育') as B on A.student_id = B.student_id where sw > if(isnull(ty),0,ty);

3、查询平均成绩大于60分的同学的学号和平均成绩；

思路：
产寻学生的id，和成绩，然后用avg函数来求得同一id号的学生平均成绩，并用having进行成绩的筛选
select student_id,avg(number) from score group by student_id having avg(number)>60;

增加显示学生名
select student_id,student.sname,avg(number) from score left join student on score.student_id=student.sid group by student_id having avg(number)>60;

第二种实现方式
个人觉得这种方式好理解一些，语法结构是
先通过select student_id,avg(number) as stu_num from score group by student_id语句分组将数据取出并起临时表别名为SCORE，然后在和student表进行连表。
select SCORE.student_id,SCORE.stu_num from (select student_id,avg(number) as stu_num from score group by student_id) as SCORE left join student on SCORE.student_id=student.sid;

4、查询所有同学的学号、姓名、选课数、总成绩；
语句进化过程：
（1）先讲student表关联起来，关联条件是student_id
select * from score left join student on score.student_id = student.sid;
（2）再通过条件筛选自己需要显示的内容，用limit来分页显示
select score.student_id,student.sname,score.corse_id,score.number from score left join student on score.student_id = student.sid limit 5;
（3）用聚合函数count来统计课程数，用sum来算成绩的合。
select score.student_id,student.sname,count(score.corse_id),sum(score.number) from score left join student on score.student_id = student.sid group by score.student_id limit 5; 
终极：
select score.student_id,student.sname,count(score.corse_id),sum(score.number) from score left join student on score.student_id = student.sid group by score.student_id;

5、查询姓“李”的老师的个数；
select count(tname) from teacher where tname like "李%";

6、查询没学过“叶平”老师课的同学的学号、姓名；
（1）查出李平老师所受的课
select cid from course left join teacher on course.teacher_id=teacher.tid where teacher.tname="李平老师";
（2）查出选择李平老师讲课的学生
select * from score where score.corse_id in (select cid from course left join teacher on course.teacher_id=teacher.tid where teacher.tname="李平老师")
（3）排除选择李平老师讲课的学生
select sid,sname from student where student.sid not in (select student_id from score where score.corse_id in (select cid from course left join teacher on course.teacher_id=teacher.tid where teacher.tname="李平老师"));


7、查询学过“001”并且也学过编号“002”课程的同学的学号、姓名；
（1）取出课程id是1和2的课程
select * from score where corse_id=1 or corse_id=2;
（2）通过student_id来进行分组根据having来过来选择两门的学生
select NEW_C.student_id,count(NEW_C.corse_id) as NUM from (select student_id,corse_id from score where corse_id=1 or corse_id=2) as NEW_C group by NEW_C.student_id having NUM=2;
（3）连表
select A.id,student.sname from (select NEW_C.student_id as ID,count(NEW_C.corse_id) as NUM from (select student_id,corse_id from score where corse_id=1 or corse_id=2) as NEW_C group by NEW_C.student_id having NUM=2) as A left join student on A.ID=student.sid;

8、查询学过“叶平”老师所教的所有课的同学的学号、姓名；
（1）连表查询课程和老师，并过滤出李平老师
select cid,cname,teacher.tname from course left join teacher on course.teacher_id=teacher.tid where teacher.tname='李平老师';
（2）查出选择李平老师课程的学生id
select * from score where corse_id in (select cid from course left join teacher on course.teacher_id=teacher.tid where teacher.tname='李平老师') group by student_id;
（3）关联学生表显示姓名
select A.student_id,student.sname from (select score.student_id from score where score.corse_id in (select course.cid from course left join teacher on course.teacher_id=teacher.tid where teacher.tname='李平老师') group by student_id) as A left join student on A.student_id=student.sid;

9、查询课程编号“002”的成绩比课程编号“001”课程低的所有同学的学号、姓名；
select A.student_id,num_id1,num_id2 from (select student_id,number as num_id1 from score where corse_id=1) as A left join (select student_id,number as num_id2 from score where corse_id=2) as B on A.student_id = B.student_id where num_id1 > if(isnull(num_id2),0,num_id2);

10、查询有课程成绩小于60分的同学的学号、姓名；
select student.sid,student.sname from (select score.student_id from score where score.number <60 group by score.student_id) as A left join student on student.sid= A.student_id;

11、查询没有学全所有课的同学的学号、姓名；
select student.sid,student.sname from (select student_id,count(corse_id) as S_NUM from score group by student_id having S_NUM < (select count(cname) as C_NUM from course)) as A left join student on student.sid=A.student_id;

12、查询至少有一门课与学号为“001”的同学所学相同的同学的学号和姓名；
（1）查询学生所选课程是否在学生id为1的学生的课程里面
select student_id from score where student_id !=1 and score.corse_id in(select corse_id from score where student_id = 1) group by student_id;
（2）和学生表关联取出相关的ID和姓名
select student.sid,student.sname from (select student_id from score where student_id !=1 and score.corse_id in(select corse_id from score where student_id = 1) group by student_id) as A left join student on A.student_id=student.sid;

13、查询至少学过学号为“001”同学所选课程中任意一门课的其他同学学号和姓名；
select student.sid,student.sname from (select student_id from score where student_id !=1 and score.corse_id in(select corse_id from score where student_id = 1) group by student_id having count(corse_id)=(select count(corse_id) from score where student_id=1)) as A left join student on A.student_id=student.sid;

14、查询和“002”号的同学学习的课程完全相同的其他同学学号和姓名；
(1)和002号同学选择的个数相同的学生id
select student_id,count(student_id) from score group by student_id having count(student_id) = (select count(1) as a from score where student_id=2)
（2）在筛选和002好同学选择课程名相同的学生id
select student_id,sname from score left join student on score.student_id = student.sid where student_id in (select student_id from score group by student_id having count(student_id) = (select count(1) as a from score where student_id=2)) and corse_id in (select corse_id from score where student_id =2) group by student_id having count(corse_id) = (select count(1) as a from score where student_id=2);


15、删除学习“叶平”老师课的SC表记录；
delete from score where corse_id in (select cid from course left join teacher on course.teacher_id = teacher.tid where teacher.tname = "李平老师");

16、向SC表中插入一些记录，这些记录要求符合以下条件：①没有上过编号“002”课程的同学学号；②插入“002”号课程的平均成绩；?
select student_id,2,(select avg(number) from score where corse_id =2) as a from score where student_id not in (select student_id from score where corse_id=2) group by student_id;

insert into score (student_id,corse_id,number) select student_id,2,(select avg(number) from score where corse_id =2) as a from score where student_id not in (select student_id from score where corse_id=2) group by student_id;

17、按平均成绩从低到高显示所有学生的“语文”、“数学”、“英语”三门的课程成绩，按如下形式显示： 学生ID,语文,数学,英语,有效课程数,有效平均分；

第一种实现方式
select SC.student_id,(select number from score where score.student_id = SC.student_id and corse_id = 1) as sw,(select number from score where score.student_id = SC.student_id and corse_id = 2) as wl,(select number from score where score.student_id = SC.student_id and corse_id = 3) as ty,(select number from score where score.student_id = SC.student_id and corse_id = 4) as ms,count(SC.corse_id),avg(SC.number) from score as SC group by SC.student_id order by avg(SC.number) desc;

第二种实现方式
select SC.student_id,(select number from score left join course on score.corse_id = course.cid where course.cname = "生物" and score.student_id = SC.student_id) as sw,(select number from score left join course on score.corse_id = course.cid where course.cname = "物理" and score.student_id = SC.student_id) as wl,(select number from score left join course on score.corse_id = course.cid where course.cname = "体育" and score.student_id = SC.student_id) as ty,(select number from score left join course on score.corse_id = course.cid where course.cname = "美术" and score.student_id = SC.student_id) as ms,count(SC.corse_id),avg(SC.number) from score as SC group by SC.student_id order by avg(SC.number) desc;


18、查询各科成绩最高和最低的分：以如下形式显示：课程ID，最高分，最低分；
思路：通过课程id来进行分组，这个时候会显示四行，然后用聚合函数max，min来找出最大值和最小值。
select corse_id,max(number) as max_num,min(number) as min_num from score group by corse_id;

19、按各科平均成绩从低到高和及格率的百分数从高到低顺序；
新知识点：case when then相当于if判断
select corse_id,avg(number),sum(case when score.number>60 then 1 else 0 end)/count(1)*100 as jgl from score group by corse_id;

20、课程平均分从高到低显示（现实任课老师）；
select A.avg_num,course.cname,teacher.tname from (select avg(number) as avg_num,corse_id from score group by corse_id) as A left join course on course.cid = A.corse_id left join teacher on teacher.tid = course.teacher_id order by A.avg_num desc;

21、查询各科成绩前三名的记录:(不考虑成绩并列情况)?
select score.sid,score.corse_id,score.number,T.first_num,T.second_num from score left join (select sid,(select number from score as s2 where s2.corse_id = s1.corse_id order by number desc limit 0,1) as first_num, (select number from score as s2 where s2.corse_id = s1.corse_id order by number desc limit 3,1) as second_num from score as s1) as T on score.sid =T.sid where score.number <= T.first_num and score.number >= T.second_num;

22、查询每门课程被选修的学生数；
select corse_id,count(score.student_id) from score group by score.corse_id;

23、查询出只选修了一门课程的全部学生的学号和姓名；
 select A.c_id,student.sname from (select count(corse_id) as c_id,student_id from score group by student_id) as A left join student on student.sid=A.student_id having A.c_id =1;

24、查询男生、女生的人数；
select * from (select count(1) as M from student where gender="男") as A,(select count(1) as W from student where gender="女") as B;

25、查询姓“张”的学生名单；
select sname from student where sname like "张%";

26、查询同名同姓学生名单，并统计同名人数；
select count(sname) from student group by sname;

27、查询每门课程的平均成绩，结果按平均成绩升序排列，平均成绩相同时，按课程号降序排列；
 select corse_id,avg(number) from score group by corse_id order by avg(number) asc,corse_id desc;

28、查询平均成绩大于85的所有学生的学号、姓名和平均成绩；
select A.student_id,student.sname,A.avg_num from (select avg(number) as avg_num,student_id from score group by student_id having avg_num > 80) as A left join student on student.sid = A.student_id;

29、查询课程名称为“数学”，且分数低于60的学生姓名和分数；
select A.student_id,student.sname,A.number from (select student_id,number from score where corse_id=(select cid from course where cname="生物") having number < 60) as A left join student on student.sid = A.student_id;

30、查询课程编号为003且课程成绩在80分以上的学生的学号和姓名；
第一种
select A.student_id,student.sname from (select student_id,number from score where corse_id=3 group by student_id having number > 80) as A left join student on student.sid=A.student_id;
第二种
select * from score where score.student_id = 3 and score.num > 80

31、求选了课程的学生人数
select count(A.student_id) from (select student_id from score group by student_id) as A;

32、查询选修“杨艳”老师所授课程的学生中，成绩最高的学生姓名及其成绩；
select score.corse_id,student.sname,score.number from score left join student on score.student_id=student.sid where score.corse_id in (select course.cid from course left join teacher on course.teacher_id=teacher.tid where tname = "刘海燕老师") order by score.number desc limit 3;

33、查询各个课程及相应的选修人数；
第一种
select A.c_num,course.cname from (select count(student_id) as c_num,corse_id from score where corse_id in (select cid from course) group by corse_id) as A left join course on course.cid =A.corse_id ;
第二种
select course.cname,count(1) from score left join course on score.corse_id = course.cid group by corse_id;

34、查询不同课程但成绩相同的学生的学号、课程号、学生成绩；
select DISTINCT s1.corse_id,s2.corse_id,s1.number,s2.number from score as s1, score as s2 where s1.number = s2.number and s1.corse_id != s2.corse_id;

35、查询每门课程成绩最好的前两名；
select score.sid,score.corse_id,score.number,T.first_num,T.second_num from score left join (select sid,(select number from score as s2 where s2.corse_id=s1.corse_id order by number desc limit 0,1)as first_num, (select number from score as s2 where s2.corse_id=s1.corse_id order by number desc limit 1,1) as second_num from score as s1) as T on score.sid = T.sid where score.number <= T.first_num and score.number >= T.second_num;


36、检索至少选修两门课程的学生学号；
select student_id,count(corse_id) from score group by student_id having count(corse_id)>1

37、查询全部学生都选修的课程的课程号和课程名；
select count(student_id) from score group by corse_id having count(student_id) = (select count(sid) from student);

38、查询没学过“叶平”老师讲授的任一门课程的学生姓名；
第一种
select sname from(select A.student_id as n_s_id from (select student_id,corse_id from score) as A left join course on course.cid=A.corse_id where course.teacher_id not in (select tid from teacher where tname="李平老师") group by A.student_id ) as B left join student on student.sid=B.n_s_id;

第二种
select student_id,student.sname from score left join student on score.student_id = student.sid where score.corse_id not in (select cid from course left join teacher on course.teacher_id = teacher.tid where tname = "李平老师") group by student_id;

39、查询两门以上不及格课程的同学的学号及其平均成绩；
select avg(number) from score where student_id in (select student_id from score where number < 60 group by student_id having count(corse_id) >1);

40、检索“004”课程分数小于60，按分数降序排列的同学学号；
select A.number,student.sname,student.sid from (select score.number,score.student_id from score where score.corse_id = 4 and score.number<60) as A left join student on student.sid = A.student_id order by A.number desc;

41、删除“002”同学的“001”课程的成绩；
delete from score where corse_id = 1 and student_id = 2